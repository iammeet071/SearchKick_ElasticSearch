import { Controller } from "@hotwired/stimulus"
let targets = ["input","suggestions"];

export default class extends Controller {
  connect() {
    
  }
  suggestions(){
    
    var query = document.getElementById("query").value;
    var url = this.element.dataset.suggestionsUrl;
    
    clearTimeout(this.timeout);
    this.timeout = setTimeout(()=>{
        this.requestSuggestions(query,url);
    },250);
  };
  requestSuggestions(query,url){
    if(query.length===0){
        this.hideSuggestions();
        return;
    }
    this.showSuggestions();
    fetch(url,{
      method:"POST",
      headers:{
        "Content-Type":"application/json",
        "X-CSRF-Token":document.querySelector("meta[name='csrf-token']").content
      },
      body: JSON.stringify({query:query}),
    }).then(response=>{
      response.text().then((html)=>{
        document.body.insertAdjacentHTML("beforeend",html);
      });
    });
  }
  childClicked(event){
    this.childWasClicked = this.element.contains(event.target);
  }
  showSuggestions(){
    this.element.classList.remove("hidden");
  }
  hideSuggestions(){  
    this.element.classList.add("hidden");

  }
}
