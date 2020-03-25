import { LightningElement,track } from 'lwc';

export default class LwcDemo2JavaScriptBinding extends LightningElement {
    @track dynamicGreeting="world from js";
    greetingChangeHandler(event){
        this.dynamicGreeting=event.target.value;
    }
}