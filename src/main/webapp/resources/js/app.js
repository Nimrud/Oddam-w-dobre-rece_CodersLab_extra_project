document.addEventListener("DOMContentLoaded", function() {





  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary
    }

  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }
});

document.getElementById("address_next_btn").addEventListener("click", function(){
  var street = $('#street_val').val();
  $('#sum_street').html(street);

  var city = $('#city_val').val();
  $('#sum_city').html(city);

  var zipCode = $('#zip_val').val();
  $('#sum_zip').html(zipCode);

  var phone = $('#phone_val').val();
  $('#sum_phone').html(phone);

  var pickUpDate = $('#date_val').val();
  $('#sum_date').html(pickUpDate);

  var pickUpTime = $('#time_val').val();
  $('#sum_time').html(pickUpTime);

  var comments = $('#comment_val').val();
  $('#sum_comment').html(comments);
});

document.getElementById("categories_next_btn").addEventListener("click", function() {
    var categories = [];

        $('.categ_val:checked').each(function () {
            categories.push($(this).val().concat(', '));
        });
    console.log(categories);
    $('#sum_categories').html(categories);
    /*
      $('#sum_categories').html(categories.join(", "));
    */
});

document.getElementById("bags_next_btn").addEventListener("click", function() {
  var bags = $('#bagsId').val();
  if(bags==1){
    $('#sum_bags').html(bags+' worek');
  }
  else if((bags==2) || (bags==3) || (bags==4)){
      $('#sum_bags').html(bags+' worki');
  }
  else {
    $('#sum_bags').html(bags+' worków');
  }
});

document.getElementById("instit_next_btn").addEventListener("click", function() {
    var institution = $('.instit_val:checked').val();
    $('#sum_instit').html('Obdarowana organizacja to '+institution);
});



// ograniczenie możliwości wpisywania znaków do pola "liczba worków" - do liczb mniejszych od 20
function setInputFilter(textbox, inputFilter) {
    ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event) {
        textbox.addEventListener(event, function() {
            if (inputFilter(this.value)) {
                this.oldValue = this.value;
                this.oldSelectionStart = this.selectionStart;
                this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
                this.value = this.oldValue;
                this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
            }
        });
    });
}

setInputFilter(document.getElementById("bagsId"), function (value) {
    return /^\d*$/.test(value) && (value === "" || parseInt(value) <= 20);
})

setInputFilter(document.getElementById("city_val"), function (value) {
    return /^[a-z\-\u00c0-\u024f]*$/i.test(value);
})

setInputFilter(document.getElementById("zip_val"), function (value) {
    return /^[(0-9)-]*$/.test(value);
})