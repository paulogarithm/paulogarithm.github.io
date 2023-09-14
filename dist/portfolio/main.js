function GetName(index) {
    let a = "a".repeat(Math.floor(index / 10) * 10);
    let b = "b".repeat(index % 10);
    return a + b;
}

class Project {
    static globalIndex = 0;

    constructor(name, description, githubLink) {
        this.name = name;
        this.description = description;
        this.githubLink = githubLink;
        this.index = Project.globalIndex

        let mainDiv = document.createElement("div");
        mainDiv.style.zIndex = (Project.globalIndex++).toString();
        mainDiv.className = GetName(this.index + 1);
        mainDiv.style.order = this.index.toString();

        let button = document.createElement("button");
        button.textContent = this.name;
        button.className = "selection";
        button.addEventListener("click", () => {this.DoSomething()});

        let vanityDiv = document.createElement("div");
        vanityDiv.className = "vanity";

        mainDiv.appendChild(button);
        mainDiv.appendChild(vanityDiv);

        let backElement = document.querySelector(".back");
        if (backElement)
            backElement.appendChild(mainDiv);
    }

    DoSomething() {
        let a = "." + GetName(this.index + 1);
        console.log(a);
        let e = document.querySelector(a);
        if (e) {
            e.style.zIndex = this.index + 10;
            e.style.order = this.index + 10;
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