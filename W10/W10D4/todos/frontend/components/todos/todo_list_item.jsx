import React from "react";

export default class TodoListItem extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        const { title } = this.props.todo;
        return <li>{title}</li>;
    }
}
