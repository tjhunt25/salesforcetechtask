import { LightningElement } from 'lwc';

export default class PicklistValueLWC extends LightningElement {
selectedValue;

get options() {
    return [
        {label: 'Name', fieldName: 'Name', type:'text'},
        {label: 'Stage', fieldName: 'StageName', type:'text'}
    ];
}

handleChange(event){
    this.selectedValue = event.target.value;
}



}