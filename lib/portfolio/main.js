// Converts a number to roman: (33) -> XXXIII
function ToRoman(num) {
  // Get some roman Numberals and values
  const romanNumerals = [
    { value: 1000, symbol: "M" },
    { value: 900, symbol: "CM" },
    { value: 500, symbol: "D" },
    { value: 400, symbol: "CD" },
    { value: 100, symbol: "C" },
    { value: 90, symbol: "XC" },
    { value: 50, symbol: "L" },
    { value: 40, symbol: "XL" },
    { value: 10, symbol: "X" },
    { value: 9, symbol: "IX" },
    { value: 5, symbol: "V" },
    { value: 4, symbol: "IV" },
    { value: 1, symbol: "I" },
  ];

  // Append each result and remove it to the value, starting from bigger
  let result = "";
  for (const numeral of romanNumerals)
    while (num >= numeral.value) {
      result += numeral.symbol;
      num -= numeral.value;
    }
  return result;
}

// Project class, to create a new project
class Project {
  static list = [];

  constructor(name, description, githubLink) {
    // Set the name and stuff
    this.name = name;
    this.description = description;
    this.githubLink = githubLink;

    // Append in the static list
    this.index = 0;
    for (this.index = 0; this.index < Project.list.length; ++this.index)
      if (Project.list[this.index] == null) break;
    Project.list[this.index] = this;

    // Create the main div
    let mainDiv = document.createElement("div");
    mainDiv.style.zIndex = this.index;
    mainDiv.style.order = this.index;
    mainDiv.className = ToRoman(this.index + 1); // Why ? cause its funny

    // Create the selection div
    let select = document.createElement("div");
    select.className = "selection";

    // Create the button
    let button = document.createElement("button");
    button.textContent = this.name;
    button.className = "selection-button";
    button.tabIndex = this.index + 1; // Accessibiliy
    button.addEventListener("click", () => {
      this.__DoSomething();
    });

    // Create the vanity div
    let vanityDiv = document.createElement("div");
    vanityDiv.className = "vanity";

    // Hierarchy set
    mainDiv.appendChild(vanityDiv);
    mainDiv.appendChild(select);
    select.appendChild(button);
    let backElement = document.querySelector(".back");
    if (backElement) backElement.appendChild(mainDiv);
  }

  __DoSomething() {
    // Search for the div
    const objectClassname = "." + ToRoman(this.index + 1);
    console.log(this.index);

    // Remove the element
    let element = document.querySelector(objectClassname);
    if (element) element.remove();

    // Append a new element and remove existing divs
    let footer = document.querySelector("footer");
    let projectDiv = document.createElement("div");
    projectDiv.tabIndex = 0; // Again accessibility
    while (footer.firstChild) footer.removeChild(footer.lastChild);
    footer.appendChild(projectDiv);

    // Create a new project
    new Project("hello", "world", "haha");
    Project.list[this.index] = null;

    // Remove the element
    delete this;
  }
}

/* MAIN */

// The json of the project (to showcase)
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
json = json.replace(/\s/g, "");

// Parse the json and create projects
const projects = JSON.parse(json);
for (const proj of projects)
  new Project(proj.Name, proj.Description, proj.Link);
