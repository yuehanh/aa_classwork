import React from "react";
import TodoListContainer from "./todos/todo_list_container";

const App = () => {
    debugger
    return (
        <div className="app">
            <h1>Top Level Todo List</h1>
            <TodoListContainer />
        </div>
    );
};

export default App;
