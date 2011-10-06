
function proceed_to_checkout(url){

  if($('accept_tos').checked){
      window.location.href = url
  }else{

      alert("Please Accept The Terms of Service Agreement To Proceed")
  }
  
}

    NOT_EMPTY = /\w+.*/
	String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
    }
//	$ = function(id){
//		return document.getElementById(id)
//	}
	
	contact_form = function(form){		
	    this.ref_form = form
	    this.els= form.elements;
		this.rules = new Array();		
		this.rules["author[fname]"] = [NOT_EMPTY,"Please Enter A First Name"];
		this.rules["author[lname]"] = [NOT_EMPTY,"Please Enter A Last Name"];
		this.rules["author[number]"] = [/(\+\d)*\s*(\(\d{3}\)\s*)*\d{3}((-|.){0,1}|\s{0,1})\d{2}((-|.){0,1}|\s{0,1})\d{2}/,"Please Enter A Valid Phone Number"];		
		this.rules["author[email]"] = [/^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/,"Please Enter A Valid Email"]
	    this.rules["author[message]"] = [NOT_EMPTY,"Please enter a message in the message field"]
	 }


	function validate(form){	
	    msg = "";
		valid = false;
		for(i=0;i<form.els.length;i++){	
			el = form.els[i];	
			if(el.getAttribute('required')!='true'){
					continue;
			}	
			try{
				rules = form.rules[el.name];
				expression = rules[0];
				error_msg = rules[1];			
			    val = el.value//.trim()
				valid = val.match(expression)
				if(!valid){	
					msg += rules[1] + "\r\n";
				}
			}catch(e){
			   
			}
		}
		 if (msg=="") {
				form.ref_form.submit()
		 }else{
				alert(msg)
		}
	}

  

