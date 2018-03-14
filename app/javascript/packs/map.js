import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
const markers = JSON.parse(mapElement.dataset.markers);
map.addMarkers(markers);
if (markers.length === 0) {
  map.setZoom(2);
} else if (markers.length === 1) {
  map.setCenter(markers[0].lat, markers[0].lng);
  map.setZoom(14);
} else {
  map.fitLatLngBounds(markers);
}

const styles = [
{
  "featureType": "landscape",
  "stylers": [
  {
    "hue": "#F1FF00"
  },
  {
    "saturation": -27.4
  },
  {
    "lightness": 9.4
  },
  {
    "gamma": 1
  }
  ]
},
{
  "featureType": "road.highway",
  "stylers": [
  {
    "hue": "#0099FF"
  },
  {
    "saturation": -20
  },
  {
    "lightness": 36.4
  },
  {
    "gamma": 1
  }
  ]
},
{
  "featureType": "road.arterial",
  "stylers": [
  {
    "hue": "#00FF4F"
  },
  {
    "saturation": 0
  },
  {
    "lightness": 0
  },
  {
    "gamma": 1
  }
  ]
},
{
  "featureType": "road.local",
  "stylers": [
  {
    "hue": "#FFB300"
  },
  {
    "saturation": -38
  },
  {
    "lightness": 11.2
  },
  {
    "gamma": 1
  }
  ]
},
{
  "featureType": "water",
  "stylers": [
  {
    "hue": "#00B6FF"
  },
  {
    "saturation": 4.2
  },
  {
    "lightness": -63.4
  },
  {
    "gamma": 1
  }
  ]
},
{
  "featureType": "poi",
  "stylers": [
  {
    "hue": "#9FFF00"
  },
  {
    "saturation": 0
  },
  {
    "lightness": 0
  },
  {
    "gamma": 1
  }
  ]
}
];

map.addStyle({
  styles: styles,
  mapTypeId: 'map_style'
});
map.setStyle('map_style');
}
