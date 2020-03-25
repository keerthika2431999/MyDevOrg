import { LightningElement,track } from 'lwc';
import {convertctof} from 'c/ctof'

export default class LwcDemo15TempConvertor extends LightningElement {
    @track convertedTemp;
    inputTemp;
    handleTempChange(event){
        this.inputTemp=parseFloat(event.target.value);
    }
    convertTemp(){
        this.convertedTemp=convertctof(this.inputTemp);
    }
}