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

// Check for mobile
window.mobileAndTabletCheck = function () {
  let check = false;
  (function (a) {
    if (
      /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino|android|ipad|playbook|silk/i.test(
        a
      ) ||
      /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(
        a.substr(0, 4)
      )
    )
      check = true;
  })(navigator.userAgent || navigator.vendor || window.opera);
  return check;
};

// Project class, to create a new project
class Project {
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
  constructor(name, description, githubLink) {
    // Set the name and stuff
    this.name = name;
    this.description = description;
    this.githubLink = githubLink;
    this.Append();
  }

  // When oppening a project to see it
  __DoSomething() {
    // Append a new element and remove existing divs
    let footer = document.querySelector("footer");
    let projectDiv = document.createElement("div");
    projectDiv.tabIndex = 0; // Again accessibility
    while (footer.firstChild) footer.removeChild(footer.lastChild);
    footer.appendChild(projectDiv);

    // Create the button
    let exitButton = document.createElement("button");
    exitButton.className = "exit";
    exitButton.textContent = "Exit";
    exitButton.addEventListener("click", () => {
      this.__DoExit();
    });
    projectDiv.appendChild(exitButton);

    // Scroll for mobile users
    console.log(window.mobileAndTabletCheck());
    projectDiv.scrollIntoView({ behavior: "smooth" });

    // UnAppend the project
    this.UnAppend();
  }

  // When click on the exit button
  __DoExit() {
    // Remove all elements in footer
    let footer = document.querySelector("footer");
    while (footer.firstChild) footer.removeChild(footer.lastChild);

    // Reappend the project
    this.Append();
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

// Go to 0, 0
window.scrollTo({
  top: 0,
  left: 0,
  behavior: "smooth",
});

// Parse the json and create projects
const projects = JSON.parse(json);
for (const proj of projects)
  new Project(proj.Name, proj.Description, proj.Link);
