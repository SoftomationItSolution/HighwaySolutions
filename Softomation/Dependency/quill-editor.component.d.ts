import QuillType from 'quill';
import Delta from 'quill';
import { AfterViewInit, EventEmitter, OnChanges, OnDestroy, OnInit, SimpleChanges } from '@angular/core';
import { ControlValueAccessor, Validator } from '@angular/forms';
import { QuillModules, CustomOption, CustomModule } from 'ngx-quill/config';
import * as i0 from "@angular/core";
export interface Range {
    index: number;
    length: number;
}
export interface ContentChange {
    content: any;
    delta: Delta;
    editor: QuillType;
    html: string | null;
    oldDelta: Delta;
    source: string;
    text: string;
}
export interface SelectionChange {
    editor: QuillType;
    oldRange: Range | null;
    range: Range | null;
    source: string;
}
export interface Blur {
    editor: QuillType;
    source: string;
}
export interface Focus {
    editor: QuillType;
    source: string;
}
export type EditorChangeContent = ContentChange & {
    event: 'text-change';
};
export type EditorChangeSelection = SelectionChange & {
    event: 'selection-change';
};
export declare abstract class QuillEditorBase implements AfterViewInit, ControlValueAccessor, OnChanges, OnInit, OnDestroy, Validator {
    format?: 'object' | 'html' | 'text' | 'json';
    theme?: string;
    modules?: QuillModules;
    debug?: 'warn' | 'log' | 'error' | false;
    readOnly?: boolean;
    placeholder?: string;
    maxLength?: number;
    minLength?: number;
    required: boolean;
    formats?: string[] | null;
    customToolbarPosition: 'top' | 'bottom';
    sanitize?: boolean;
    beforeRender?: () => Promise<void>;
    styles: any;
    strict: boolean;
    scrollingContainer?: HTMLElement | string | null;
    bounds?: HTMLElement | string;
    customOptions: CustomOption[];
    customModules: CustomModule[];
    trackChanges?: 'user' | 'all';
    preserveWhitespace: boolean;
    classes?: string;
    trimOnValidation: boolean;
    linkPlaceholder?: string;
    compareValues: boolean;
    filterNull: boolean;
    debounceTime?: number;
    defaultEmptyValue?: any;
    onEditorCreated: EventEmitter<any>;
    onEditorChanged: EventEmitter<EditorChangeContent | EditorChangeSelection>;
    onContentChanged: EventEmitter<ContentChange>;
    onSelectionChanged: EventEmitter<SelectionChange>;
    onFocus: EventEmitter<Focus>;
    onBlur: EventEmitter<Blur>;
    onNativeFocus: EventEmitter<Focus>;
    onNativeBlur: EventEmitter<Blur>;
    quillEditor: QuillType;
    editorElem: HTMLElement;
    content: any;
    disabled: boolean;
    preserve: boolean;
    toolbarPosition: string;
    onModelChange: (modelValue?: any) => void;
    onModelTouched: () => void;
    onValidatorChanged: () => void;
    private subscription;
    private quillSubscription;
    private elementRef;
    private document;
    private cd;
    private domSanitizer;
    private platformId;
    private renderer;
    private zone;
    private service;
    static normalizeClassNames(classes: string): string[];
    valueGetter: (quillEditor: QuillType, editorElement: HTMLElement) => string | any;
    valueSetter: (quillEditor: QuillType, value: any) => any;
    ngOnInit(): void;
    ngAfterViewInit(): void;
    selectionChangeHandler: (range: Range | null, oldRange: Range | null, source: string) => void;
    textChangeHandler: (delta: Delta, oldDelta: Delta, source: string) => void;
    editorChangeHandler: (event: 'text-change' | 'selection-change', current: any | Range | null, old: any | Range | null, source: string) => void;
    ngOnDestroy(): void;
    ngOnChanges(changes: SimpleChanges): void;
    addClasses(classList: string): void;
    removeClasses(classList: string): void;
    writeValue(currentValue: any): void;
    setDisabledState(isDisabled?: boolean): void;
    registerOnChange(fn: (modelValue: any) => void): void;
    registerOnTouched(fn: () => void): void;
    registerOnValidatorChange(fn: () => void): void;
    validate(): {
        minLengthError?: {
            given: number;
            minLength: number;
        };
        maxLengthError?: {
            given: number;
            maxLength: number;
        };
        requiredError?: {
            empty: boolean;
        };
    };
    private addQuillEventListeners;
    private dispose;
    static ɵfac: i0.ɵɵFactoryDeclaration<QuillEditorBase, never>;
    static ɵdir: i0.ɵɵDirectiveDeclaration<QuillEditorBase, never, never, { "format": { "alias": "format"; "required": false; }; "theme": { "alias": "theme"; "required": false; }; "modules": { "alias": "modules"; "required": false; }; "debug": { "alias": "debug"; "required": false; }; "readOnly": { "alias": "readOnly"; "required": false; }; "placeholder": { "alias": "placeholder"; "required": false; }; "maxLength": { "alias": "maxLength"; "required": false; }; "minLength": { "alias": "minLength"; "required": false; }; "required": { "alias": "required"; "required": false; }; "formats": { "alias": "formats"; "required": false; }; "customToolbarPosition": { "alias": "customToolbarPosition"; "required": false; }; "sanitize": { "alias": "sanitize"; "required": false; }; "beforeRender": { "alias": "beforeRender"; "required": false; }; "styles": { "alias": "styles"; "required": false; }; "strict": { "alias": "strict"; "required": false; }; "scrollingContainer": { "alias": "scrollingContainer"; "required": false; }; "bounds": { "alias": "bounds"; "required": false; }; "customOptions": { "alias": "customOptions"; "required": false; }; "customModules": { "alias": "customModules"; "required": false; }; "trackChanges": { "alias": "trackChanges"; "required": false; }; "preserveWhitespace": { "alias": "preserveWhitespace"; "required": false; }; "classes": { "alias": "classes"; "required": false; }; "trimOnValidation": { "alias": "trimOnValidation"; "required": false; }; "linkPlaceholder": { "alias": "linkPlaceholder"; "required": false; }; "compareValues": { "alias": "compareValues"; "required": false; }; "filterNull": { "alias": "filterNull"; "required": false; }; "debounceTime": { "alias": "debounceTime"; "required": false; }; "defaultEmptyValue": { "alias": "defaultEmptyValue"; "required": false; }; "valueGetter": { "alias": "valueGetter"; "required": false; }; "valueSetter": { "alias": "valueSetter"; "required": false; }; }, { "onEditorCreated": "onEditorCreated"; "onEditorChanged": "onEditorChanged"; "onContentChanged": "onContentChanged"; "onSelectionChanged": "onSelectionChanged"; "onFocus": "onFocus"; "onBlur": "onBlur"; "onNativeFocus": "onNativeFocus"; "onNativeBlur": "onNativeBlur"; }, never, never, false, never>;
}
export declare class QuillEditorComponent extends QuillEditorBase {
    static ɵfac: i0.ɵɵFactoryDeclaration<QuillEditorComponent, never>;
    static ɵcmp: i0.ɵɵComponentDeclaration<QuillEditorComponent, "quill-editor", never, {}, {}, never, ["[quill-editor-toolbar]"], true, never>;
}
