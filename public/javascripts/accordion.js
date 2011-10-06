if(typeof Effect=='undefined')throw("accordion.js requires including script.aculo.us' effects.js library!");var accordion=Class.create();accordion.prototype={showAccordion:null,currentAccordion:null,duration:null,effects:[],animating:false,AlreadyActivated:[],initialize:function(container,options){if(!$(container)){throw(container+" doesn't exist!");return false;}this.options=Object.extend({resizeSpeed:8,classNames:{toggle:'accordion_toggle',toggleActive:'accordion_toggle_active',content:'accordion_content'},defaultSize:{height:null,width:null},direction:'vertical',onEvent:'click',onActivate:null,RepeatActivate:{}},options||{});this.duration=((11-this.options.resizeSpeed)*0.15);this.AlreadyActivated=[];var accordions=$$('#'+container+' .'+this.options.classNames.toggle);accordions.each(function(accordion){Event.observe(accordion,this.options.onEvent,this.activate.bind(this,accordion),false);if(this.options.onEvent=='click'){accordion.onclick=function(){return false;};}if(this.options.direction=='horizontal'){var options={width:'0px'};}else{var options={height:'0px'};}Object.extend(options,{display:'none'});this.currentAccordion=$(accordion.next(0)).setStyle(options);}.bind(this));},activate:function(accordion){if(this.animating){return false;}this.effects=[];this.currentAccordion=$(accordion.next(0));this.currentAccordion.setStyle({display:'block'});this.currentAccordion.previous(0).addClassName(this.options.classNames.toggleActive);if(this.options.direction=='horizontal'){this.scaling={scaleX:true,scaleY:false};}else{this.scaling={scaleX:false,scaleY:true};}if(this.currentAccordion==this.showAccordion){this.deactivate();}else{var bolCall=true;var elementid=$(this.currentAccordion).id var AA=this.AlreadyActivated.indexOf(elementid);var RA=this.options.RepeatActivate[elementid];if(RA!=undefined){if(AA!=-1){if(RA!=undefined)bolCall=RA;}else{this.AlreadyActivated.push(elementid);}}if(this.options.onActivate&&bolCall)this.options.onActivate(this.currentAccordion);this._handleAccordion();}},deactivate:function(){var options={duration:this.duration,scaleContent:false,transition:Effect.Transitions.sinoidal,queue:{position:'end',scope:'accordionAnimation'},scaleMode:{originalHeight:this.options.defaultSize.height?this.options.defaultSize.height:this.currentAccordion.scrollHeight,originalWidth:this.options.defaultSize.width?this.options.defaultSize.width:this.currentAccordion.scrollWidth},afterFinish:function(){this.showAccordion.setStyle({height:'0px',display:'none'});this.showAccordion=null;this.animating=false;}.bind(this)};Object.extend(options,this.scaling);this.showAccordion.previous(0).removeClassName(this.options.classNames.toggleActive);new Effect.Scale(this.showAccordion,0,options);},_handleAccordion:function(){var options={sync:true,scaleFrom:0,scaleContent:false,transition:Effect.Transitions.sinoidal,scaleMode:{originalHeight:this.options.defaultSize.height?this.options.defaultSize.height:this.currentAccordion.scrollHeight,originalWidth:this.options.defaultSize.width?this.options.defaultSize.width:this.currentAccordion.scrollWidth}};Object.extend(options,this.scaling);this.effects.push(new Effect.Scale(this.currentAccordion,100,options));if(this.showAccordion){this.showAccordion.previous(0).removeClassName(this.options.classNames.toggleActive);options={sync:true,scaleContent:false,transition:Effect.Transitions.sinoidal};Object.extend(options,this.scaling);this.effects.push(new Effect.Scale(this.showAccordion,0,options));}new Effect.Parallel(this.effects,{duration:this.duration,queue:{position:'end',scope:'accordionAnimation'},beforeStart:function(){this.animating=true;}.bind(this),afterFinish:function(){if(this.showAccordion){this.showAccordion.setStyle({display:'none'});}$(this.currentAccordion).setStyle({height:'auto'});this.showAccordion=this.currentAccordion;this.animating=false;}.bind(this)});}}