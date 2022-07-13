$(document).ready(function () {
  $('#example').DataTable();
});

// Sides in the side navigation bar by increasing its width.
function openNav() {
  document.getElementById("sideBar").style.width = "300px"; //sets the width of sidenav to 300px.
  document.getElementById("main").style.marginLeft = "300px"; //sets the right margin of main to 300px (slides the web page to show pushing effect).
  document.body.style.backgroundColor = "rgba(0,0,0,0.4)"; //changes background color to show opacity effect.
}

// Closes the side navigation bar bar by setting its width to zero.
function closeNav() {
  document.getElementById("sideBar").style.width = "0"; //sets the width of sidenav to 0(hides the side navigation bar).
  document.getElementById("main").style.marginLeft = "20px"; //sets the right margin of main to 0.
  document.body.style.backgroundColor = "#fcfcfc"; //changes the background color of body back to normal.
   
}

function checkBox() {
  document.getElementById("dropdown-action").style.checked = "unchecked";
  if (dropdown - action.style.checked == "checked") {
    document.getElementById("dropdown-action").style.checked = "unchecked";
  } else {
    document.getElementById("dropdown-action").style.checked = "checked";
  }
}

function signUp() {
  document.getElementById("backface").style.display = "flex";
  document.getElementById("signUp").style.display = "flex";
  document.getElementById("frontface").style.display = "none";
  document.getElementById("signIn").style.display = "none";
}

function signIn(){
  document.getElementById("frontface").style.display = "flex";
  document.getElementById("front").style.width="390px";
  document.getElementById("signIn").style.display = "flex";
  document.getElementById("backface").style.display = "none";
  document.getElementById("signUp").style.display = "none";
}

function dropdown() {
  var dropdown = document.getElementById("dropdown");
  if (dropdown.style.display == "none") {
    dropdown.style.display = "block";
  } else {
    dropdown.style.display = "none";
  }
}

function closeDropdown(){
    document.getElementById("dropdown").style.display="none";
    document.getElementById("sideBar").style.width = "0"; //sets the width of sidenav to 0(hides the side navigation bar).
    document.body.style.backgroundColor = "#fcfcfc"; //changes the background color of body back to normal.

    var main = document.getElementById("main")
  if (main.style.marginLeft != "20px") {
    main.style.marginLeft="20px"
  }

}
// validateForm() is called when the form gets submitted and this function gets all the values from the fields and put them in the variables.
function validateForm() {
  var fName = document.forms["queryForm"]["fName"].value;
  var lName = document.forms["queryForm"]["lName"].value;
  var email = document.forms["queryForm"]["email"].value;
  var query = document.forms["queryForm"]["query"].value;
  var queryType = document.forms["queryForm"]["queryType"].value;

  // Checks if the reuired necessary fields have been filled or not before validating it.
  if (fName == "" || lName == "" || email == "" || query == "") {
    alert("Empty fields found. Please fill in the empty fields."); //The user is asked to input necessary fields.
  } else {
    alert("Thank you for the query. I will reach out to you ASAP."); //The user is notified abut the submission of his query.
  }
}


$(document).ready(function () {
  $('#example').DataTable();
});

// add form for product
function addProduct() {
  document.getElementById("product-form").style.display="flex";
  document.getElementById("example_wrapper").style.display="none";
  document.getElementById("addButton").style.display="none";
}

function closeAddMenu() {
  document.getElementById("product-form").style.display="none";
  document.getElementById("addButton").style.display="flex";
  document.getElementById("example_wrapper").style.display="inline";
}