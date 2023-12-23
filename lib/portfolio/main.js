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
  static active = null;
  static list = [];

  // Realign the static list
  static Realign() {
    // Create a new shifted list
    let newList = Project.list.filter((e) => e !== null);

    // Loop to change the indexes
    let k = 0;
    for (let object of Project.list) {
      if (object === null) continue;

      // Change the classname to index
      const objectClassname = "." + ToRoman(newList[k].index + 1);
      let element = document.querySelector(objectClassname);
      if (element) element.className = ToRoman(k + 1);
      newList[k].index = k;
      ++k;
    }

    // Set the new list
    Project.list = newList;
  }

  // Append a project in box
  Append() {
    // Add it in the list
    this.index = 0;
    for (this.index = 0; this.index < Project.list.length; ++this.index)
      if (Project.list[this.index] == null) break;
    Project.list[this.index] = this;
    Project.Realign();

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
    button.tabIndex = 1; // Accessibiliy
    button.addEventListener("click", () => {
      this.__DoShowcase();
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

  // Remove a project from box
  UnAppend() {
    // Remove from list
    Project.list[this.index] = null;
    Project.Realign();

    // Search for the div and remove it
    const objectClassname = "." + ToRoman(this.index + 1);
    let element = document.querySelector(objectClassname);
    if (element) element.remove();
  }

  // Create a new project
  constructor(proj) {
    // Set the name and stuff
    this.name = proj.name;
    this.description = proj.description;
    this.githubLink = proj.link;
    this.isEpitech = proj.isEpitech;
    this.Append();
  }

  // When oppening a project to see it
  __DoShowcase() {
    // Remove old active project and append this one
    if (Project.active !== null) {
      Project.__DoExit();
    }
    Project.active = this;

    // Append a new element and remove existing divs
    let footer = document.querySelector("footer");
    let projectDiv = document.createElement("div");
    while (footer.firstChild) footer.removeChild(footer.lastChild);
    footer.appendChild(projectDiv);

    // Create the button
    let exitButton = document.createElement("button");
    exitButton.className = "exit";
    exitButton.textContent = "Exit";
    exitButton.addEventListener("click", () => {
      Project.__DoExit();
    });
    projectDiv.appendChild(exitButton);

    // Create the epitech logo
    if (this.isEpitech) {
      let epitechNode = document.createElement("img");
      epitechNode.src = "assets/epitech.webp";
      epitechNode.className = "epitech-logo";
      epitechNode.alt = "an epitech project";
      projectDiv.appendChild(epitechNode);
    }

    // Create the title
    let titleNode = document.createElement("h1");
    titleNode.textContent = this.name;
    projectDiv.appendChild(titleNode);

    // Create the description
    let descDiv = document.createElement("div");
    descDiv.className = "text";
    projectDiv.appendChild(descDiv);
    let descNode = document.createElement("p");
    descNode.textContent = this.description;
    descDiv.appendChild(descNode);

    // Create the foot
    let footDiv = document.createElement("div");
    footDiv.className = "foot";
    projectDiv.appendChild(footDiv);

    // Create the github stuff
    if (this.githubLink) {
      let githubText = document.createElement("p");
      githubText.className = "github-text";
      githubText.textContent = "Check the github repository -> ";
      footDiv.appendChild(githubText);

      let githubButton = document.createElement("input");
      githubButton.type = "image";
      githubButton.alt = "view github";
      githubButton.src = "assets/github.png";
      githubButton.className = "github-logo";
      githubButton.onclick = () => {
        console.log("Haha");
      }
      footDiv.appendChild(githubButton);
    }

    // Scroll for mobile users
    projectDiv.scrollIntoView({ behavior: "smooth" });

    // UnAppend the project
    this.UnAppend();
  }

  // When click on the exit button
  static __DoExit() {
    // Check if there is an active project
    if (Project.active == null) return;

    // Remove all elements in footer
    let footer = document.querySelector("footer");
    while (footer.firstChild) footer.removeChild(footer.lastChild);

    // Reappend the project
    Project.active.Append();
    Project.active = null;

    // Scroll to top
    window.scrollTo({ top: 0, behavior: "smooth" });
  }
}

/* MAIN */

// The json of the project (to showcase)
let json = `[{
  "name": "Alu",
  "description": "Test",
  "link": "https://github.com/paulogarithm/Alu",
  "isEpitech": false,
  "languages": ["C"]
},
{
  "name": "42sh",
  "description": "Test",
  "link": "https://github.com/paulogarithm/42sh",
  "isEpitech": true,
  "languages": ["C"]
},
{
  "name": "Yamlc",
  "description": "Yamlc is a yaml parser for the C language. Its simple to use and to set up, and can work in any C / C++ project !",
  "link": "https://github.com/paulogarithm/yamlc",
  "isEpitech": false,
  "languages": ["C"]
}
]`;

// Go to 0, 0
window.scrollTo({
  top: 0,
  left: 0,
  behavior: "smooth",
});

// Parse the json and create projects
const projects = JSON.parse(json);
for (const proj of projects) new Project(proj);
