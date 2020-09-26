
const todoUL = document.querySelector(".todos");
const todoForm = document.querySelector(".add-todo-form");
const todoInput = document.getElementsByName("add-todo")[0] //as TA???

const todos = JSON.parse(localStorage.todo || '[]');

export function addTodo(){
    
    const todoInputVal = todoInput.value
    const todoItem = {done: false, item: todoInputVal}
    todos.push(todoItem);
    todoInput.value = "";
    localStorage.setItem( 'todo', JSON.stringify(todos) )
}

function populateList(){
    let i = 0
    for(const todo of todos){
        const label = document.createElement("label");
        const checkbox = document.createElement("input");
        const li = document.createElement("li")
        checkbox.type = "checkbox";
        checkbox.id = i
        checkbox.data = ({done: false})
        label.innerText = todo.item;
        label.appendChild(checkbox)
        li.appendChild(label)
        todoUL.appendChild(li)
        i++
    }
}


function toggleTodo (el){
    el.data.done = !el.data.done;
}

todoForm.addEventListener("submit", ()=>{
    event.preventDefault();
    addTodo();
    while (todoUL.firstChild) {
        todoUL.removeChild(todoUL.firstChild);
      }
    populateList();
});

populateList();


