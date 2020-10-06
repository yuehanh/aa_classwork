import React from 'react';
import { uniqueId } from '../../util/uniqueId'


export default class TodoForm extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        title: "",
        body: "",
        done: false
      };
    }