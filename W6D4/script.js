document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  document.querySelector('.favorite-submit').addEventListener('click', (e) => {
    e.preventDefault();
    const input = document.querySelector('.favorite-input');
    const value = input.value
    const li = document.createElement('li');
    li.textContent = value;
    input.value = '';
    const ul = document.querySelector('#sf-places');
    // debugger;
    ul.appendChild(li);
  });

  // adding new photos

  // --- your code here!
  document.querySelector('.photo-show-button').addEventListener('click', (e) => {
    const form = document.querySelector('.photo-form-container');
    if (form.className === 'photo-form-container') {
      form.className = "photo-form-container hidden";
    } else {
      form.className = "photo-form-container";
    }
  });


  document.querySelector('.photo-url-submit').addEventListener('click', (e)=>{
    e.preventDefault();
    const input = document.querySelector('.photo-url-input');
    const value = input.value;
    input.value = '';
    const img = document.createElement('img');
    img.src = value;
    const li = document.createElement('li');
    li.appendChild(img);
    const ul = document.querySelector('.dog-photos');
    ul.appendChild(li);
  });

  


});
