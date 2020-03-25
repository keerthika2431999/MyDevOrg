import { LightningElement } from 'lwc';

export default class LwcDemo6NonReactivePrivateProp extends LightningElement {
    nonReactivePrivateProp = "Demo 6 Non Reactive Private Property"

    handleClick(){
        this.nonReactivePrivateProp = "Property Value Changed";
        console.log(">>>>"+this.nonReactivePrivateProp);
    }
}
