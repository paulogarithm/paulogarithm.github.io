function ToRoman(num) {
    const romanNumerals = [
        { value: 1000, symbol: 'M' },
        { value: 900, symbol: 'CM' },
        { value: 500, symbol: 'D' },
        { value: 400, symbol: 'CD' },
        { value: 100, symbol: 'C' },
        { value: 90, symbol: 'XC' },
        { value: 50, symbol: 'L' },
        { value: 40, symbol: 'XL' },
        { value: 10, symbol: 'X' },
        { value: 9, symbol: 'IX' },
        { value: 5, symbol: 'V' },
        { value: 4, symbol: 'IV' },
        { value: 1, symbol: 'I' }
    ];
    let result = '';
    for (const numeral of romanNumerals) {
        while (num >= numeral.value) {
            result += numeral.symbol;
            num -= numeral.value;
        }
    }
    return result;
}

class Project {
    static globalIndex = 1;
    static list = [];

    constructor(name, description, githubLink) {

        // Set the name and stuff
        this.name = name;
        this.description = description;
        this.githubLink = githubLink;
        this.index = Project.globalIndex++;
        
        // Create the main div
        let mainDiv = document.createElement("div");
        mainDiv.style.zIndex = this.index;
        mainDiv.style.order = this.index;
        mainDiv.className = ToRoman(this.index);
        
        // Create the selection div
        let select = document.createElement("div");
        select.className = "selection";
        
        // Create the button
        let button = document.createElement("button");
        button.textContent = this.name;
        button.className = "selection-button";
        button.addEventListener("click", () => {this.__DoSomething()});

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

    __DoSomething() {
        const a = "." + ToRoman(this.index);
        console.log(this.index);

        let e = document.querySelector(a);
        if (e)
            e.remove();
    }
}

let json = `
[
    {
        "Name": "fvm",
        "Description": "Test",
        "Link": "https://github.com/paulogarithm/fvm",
        "IsEpitech": false,
        "Languages": ["C"]
    },
    {
        "Name": "42sh",
        "Description": "Test",
        "Link": "https://github.com/paulogarithm/42sh",
        "IsEpitech": true,
        "Languages": ["C"]
    }
]`;
json = json.replace(/\s/g, '');

const projects = JSON.parse(json);
for (const proj of projects) {
    new Project(proj.Name, proj.Description, proj.Link);
}
