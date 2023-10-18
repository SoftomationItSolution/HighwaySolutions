import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'serchFilter'
})
export class SerchFilterPipe implements PipeTransform {
  transform(items: any[], searchText: string, flag: string): any {
    if (!items) { return []; }
    if (!searchText) { return items; }
    searchText = searchText;
    if (flag == 'filtermenu') {
      return items.filter( it => {
        return (
            ((it.ParentId).toString()).toLowerCase() == searchText
        );
      });
    } 
    else if (flag == 'filterkey') {
      return items.filter( it => {
        return (
            ((it.key).toString()).toLowerCase() == searchText
        );
      });
    } else if (flag == '!filterkey') {
      return items.filter( it => {
        return (
            ((it.key).toString()).toLowerCase() != searchText
        );
      });
    }else if (flag == 'whitespace') {
      if (searchText === undefined) {
        return 'undefined';
      }
      return searchText.replace(/\s/g, '');
    } else if (flag == 'reader') {
      return items.filter( it => {
        return (
            ((it.hardwareType)) == 1
        );
      });
    } else if (flag == 'camera') {
      return items.filter( it => {
        return (
            ((it.hardwareType)) == 2
        );
      });
    }
  }
}
