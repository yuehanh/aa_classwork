import React from "react";
import { receiveTodos } from "../../actions/todo_actions";
import TodoListItem from "./todo_list_item";

// export const TodoList = () => <h1>Hello</h1>
export default class TodoList extends React.Component {
    render() {
        const { todos, receiveTodo } = this.props;
        const todoItems = todos.map((todo) => {
            return <TodoListItem key={todo.id} todo={todo}></TodoListItem>;
        });

        return (
            <div>
                <ul className="todo-list">{todoItems}</ul>
                <TodoForm receiveTodo={receiveTodo} />
            </div>
        );
    }
}
