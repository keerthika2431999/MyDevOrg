import { LightningElement } from 'lwc';

export default class LwcDemo12LifeCycle extends LightningElement {
    constructor(){
        super();
        console.log("Constructor called");
    }
connectedCallback(){
    console.log("connectedcallback");
}
renderedCallback(){
    console.log("rendered call back");
}
disconnectedCallback(){
    console.log("disconnected call back");
}
}