function GetName(index) {
    let a = "a".repeat(Math.floor(index / 10));
    let b = "b".repeat(index % 10);
    return a + b;
}

class Project {
    static globalIndex = 1;
    static list = [];

    constructor(name, description, githubLink) {
        this.name = name;
        this.description = description;
        this.githubLink = githubLink;
        this.index = Project.globalIndex++;

        let mainDiv = document.createElement("div");
        mainDiv.style.zIndex = this.index;
        mainDiv.style.order = this.index;
        mainDiv.className = GetName(this.index);

        let select = document.createElement("div");
        select.className = "selection";

        let button = document.createElement("button");
        button.textContent = this.name;
        button.className = "selection-button";
        button.addEventListener("click", () => {this.DoSomething()});

        let vanityDiv = document.createElement("div");
        vanityDiv.className = "vanity";

        mainDiv.appendChild(vanityDiv);
        mainDiv.appendChild(select);
        select.appendChild(button);

        let backElement = document.querySelector(".back");
        if (backElement)
            backElement.appendChild(mainDiv);
        Project.list.push(this);
    }

    DoSomething() {
        let a = "." + GetName(this.index);
        console.log(this.index);

        let e = document.querySelector(a);
        if (e) {
            this.index += 10;
            e.style.zIndex = this.index;
            e.style.order = this.index;
            e.className = GetName(this.index);
        }
    }
}

/////////////////////////////

new Project("fvm", "Test", "https://github.com/paulogarithm/fvm");
new Project("42sh", "Test", "https://github.com/paulogarithm/test");
new Project("src", "Test", "https://github.com/paulogarithm/test");
new Project("sokoban", "Test", "https://github.com/paulogarithm/test");
new Project("hunter", "Test", "https://github.com/paulogarithm/test");
new Project("navy", "Test", "https://github.com/paulogarithm/test");

console.log("Hello");