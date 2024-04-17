// import { Component, ViewChild, ElementRef } from '@angular/core';
import H from '@here/maps-api-for-javascript';
import onResize from 'simple-element-resize-detector';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
@Component({
    selector: 'app-jsmap',
    templateUrl: './jsmap.component.html',
    styleUrls: ['./jsmap.component.css']
})
export class JsmapComponent {
    MapZoom = 8;
    DefaultCordinatelat = 28.45434872192383;
    DefaultCordinatelong = 77.3033420679237;
    private map?: H.Map;
    mapUI?: H.ui.UI
    @ViewChild('map') mapDiv?: ElementRef;

    ngAfterViewInit(): void {
        if (!this.map && this.mapDiv) {
            const platform = new H.service.Platform({
                apikey: 'Oyib6yC37a1SiQwuOIGdo9EBkUMvzQ9beIb23mNqwbo'
            });
            const defaultLayers = platform.createDefaultLayers();
            const map = new H.Map(
                this.mapDiv.nativeElement, (defaultLayers as any).vector.normal.map,
                {
                    zoom: this.MapZoom,
                    center: { lat: this.DefaultCordinatelat, lng: this.DefaultCordinatelong },
                    pixelRatio: window.devicePixelRatio
                },
            );
            let mapView = map.getViewModel();
            const behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));
            this.mapUI = H.ui.UI.createDefault(map, defaultLayers);
            // this.mapUI.getControl('mapsettings').setAlignment('top-left');
            // this.mapUI.getControl('zoom').setAlignment('top-left');
            // this.mapUI.getControl('scalebar').setAlignment('top-left');
            onResize(this.mapDiv.nativeElement, () => {
                map.getViewPort().resize();
            });
            this.map = map;
        }

    }


}
