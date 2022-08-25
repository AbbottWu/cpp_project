import * as React from 'react';

export function List_Items(props, style, rounded = 'none') {
    const baseStyle = ' flex items-center ';
    switch (props.items.length) {
      case 0:
        return (<ul className='flex flex-col'></ul>);
      case 1:
        return (<ul className='flex flex-col'>
          <li key={0} className={style + baseStyle + 'rounded-' + rounded}>
            {props.items[0]}
          </li>
        </ul>);
  
      case 2:
        return (
        <ul className='flex flex-col'>
          <li key={0} className={style + baseStyle + 'rounded-t-' + rounded}>
            {props.items[0]}
          </li>
          <li key={1} className={style + baseStyle + 'rounded-b-' + rounded}>
            {props.items[1]}
          </li>
        </ul>);
      default:
        const first = (
          <li key={0} className={style + baseStyle + 'rounded-t-' + rounded}>
            {props.items[0]}
          </li>
        );
        const others = props.items.slice(1, -1);
  
        const last = (
          <li key={props.items.length} className={style + baseStyle + 'rounded-b-' + rounded}>
            {props.items[props.items.length - 1]}
          </li>
        );
  
        const listItems = others.map((item, index) =>
          <li key={index + 1} className={style + baseStyle}>
            {item}
          </li>
        )
        return (
          <ul className='flex flex-col'>{[first, ...listItems, last]}</ul>
        )
    }
  }
  