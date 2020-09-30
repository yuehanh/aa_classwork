import React from 'react';
import Clock from './frontend/clock'
import Tabs from './frontend/tabs'


const items = [{title: "one", content: "4"},{title: "two", content: "5"},{title: "three", content: "6"}];

const Root = (props) => {
  return (
    <div>
      <Clock/>
      <Tabs items={items}/>
      
    </div>
  );
}

export default Root;