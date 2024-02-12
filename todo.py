import os

INDENT_LENGTH = 4
TODO_FILE = "/home/harrek/.todo"


class TodoItem():
    def __init__(self, text: str, complete: bool = False, indent_level: int = 0, parent = None):
        self.text = text
        self.children = []
        self.done = complete
        self.indent_level = indent_level
        self.parent = parent

    def add_child(self, text: str, complete: bool = False):
        self.children.append(TodoItem(text, complete, (self.indent_level+1), self))
        return self.children[-1]
    
    def to_string(self, index = ""):
        if self.text == "":
            return ""
        return f" {index}  {((self.indent_level - 1) * INDENT_LENGTH - len(index)) * ' '}- [{'x' if self.done else ' '}] {self.text}"

    def print_children(self, index = ""):
        print(self.to_string(index))
        for i, child in enumerate(self.children):
            child.print_children(index + str(i))

    def remove(self, index_to_remove):
        self.children.pop(index_to_remove)

    def complete(self, is_complete: bool = True):
        self.done = is_complete
        for child in self.children:
            child.complete(is_complete)

    def remove_all_complete(self):
        self.children = [child for child in self.children if child.done == False]
        for child in self.children:
            child.remove_all_complete()

    def to_file_string(self):
        current_string = ""
        if self.to_string() == "":
            current_string += (self.to_string())
        else:
            current_string += (self.to_string() + "\n")
        for child in self.children:
            current_string += (child.to_file_string())
        
        return current_string



def read_file(filepath: str) -> TodoItem:
    """ 
    Todo Item Syntax: 
      - [ ] Todo Item Text
          - [x] Indented Todo
    """
    file_to_read = open(filepath)
    current_indent = -1
    todos = [TodoItem("")]
    for line in file_to_read:
        indent, todo_item = line.split("- [")
        complete, text = todo_item.split("]")

        indent = (len(indent)) // INDENT_LENGTH
        complete = (complete == "x")
        todos = todos[:indent + 1]
        todos.append(todos[-1].add_child(text.strip(), complete))

    return todos[0]


def print_help():
    return ("""
 Valid commands: 
 q             - save and quit
 q!            - quit without saving
 h             - show this menu
 a {n} {text}  - add a child task to task n
 c {n}         - complete task n (and all children)
 u {n}         - un-complete task n (and all children)
 l             - remove all complete tasks and their children
 w             - save the file

 ---
            """)

def get_todo(todo_list, index: str):
    current_todo = todo_list
    for character in index:
            current_todo = current_todo.children[int(character)]
    return current_todo

def write_to_file(todo_list):
    file_to_write = open(TODO_FILE, "w")
    file_to_write.write(todo_list.to_file_string())
    file_to_write.close()

def process_user_input(user_input, todo_list):
    command: [str] = user_input.split(" ")
    try:
        match command[0]:
            case "h":
                return(print_help())
            case "a":
                try:
                    get_todo(todo_list, command[1]).add_child(" ".join(command[2:]))
                except IndexError:
                    return "Operation failed to to an incorrect index."
            case "d" | "r":
                try:
                    get_todo(todo_list, command[1][:-1]).remove(int(command[1][-1]))
                except IndexError:
                    return "Operation failed to to an incorrect index."
            case "c":
                try:
                    get_todo(todo_list, command[1]).complete()
                except IndexError:
                    return "Operation failed to to an incorrect index."
            case "u":
                try:
                    get_todo(todo_list, command[1]).complete(False)
                except IndexError:
                    return "Operation failed to to an incorrect index."
            case "l":
                todo_list.remove_all_complete()
            case "w":
                write_to_file(todo_list)
            case "q":
                write_to_file(todo_list)
                return "exit"
            case "q!":
                return "exit"
            case _:
                return "Invalid Command. Use :h for valid commands"
        return ""
    except:
        return "you did something wrong and I couldn't be bothered writing an error for it. Check :h for how to use the app"


def main():
    todo_list = read_file(TODO_FILE)

    message = ""
    while message != "exit":
        os.system("clear")
        if message:
            print(message)
        message = ""
        todo_list.print_children()
        user_input = input(": ")
        message = process_user_input(user_input, todo_list)

if __name__ == "__main__":
    main()
