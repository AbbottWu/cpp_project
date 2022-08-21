#include "infrastructure.h"
using namespace std;

int preNUm(unsigned char byte) {
	unsigned char mask = 0x80;
	int num = 0;
	for (int i = 0; i < 8; i++) {
		if ((byte & mask) == mask) {
			mask = mask >> 1;
			num++;
		}
		else {
			break;
		}
	}
	return num;
}

bool isUtf8(const char* data, int len) {
	int num = 0;
	int i = 0;
	while (i < len) {
		if ((data[i] & 0x80) == 0x00) {
			// 0XXX_XXXX
			i++;
			continue;
		}
		else if ((num = preNUm(data[i])) > 2) {
			i++;
			for (int j = 0; j < num - 1; j++) {
				if ((data[i] & 0xc0) != 0x80) {
					return false;
				}
				i++;
			}
		}
		else {
			return false;
		}
	}
	return true;
}

std::string to_utf8(const std::string& source) {
	if (!isUtf8(&source[0], source.length())) {
		std::wstring temp = std::wstring_convert<std::codecvt_utf16<wchar_t> >().from_bytes(source);
		return std::wstring_convert<std::codecvt_utf8<wchar_t> >().to_bytes(temp);
	}
	return source;
}

std::string to_utf16(const std::string& source) {
	if (isUtf8(&source[0], source.length())) {
		std::wstring temp = std::wstring_convert<std::codecvt_utf8<wchar_t> >().from_bytes(source);
		return std::wstring_convert<std::codecvt_utf16<wchar_t> >().to_bytes(temp);
	}
	return source;
}