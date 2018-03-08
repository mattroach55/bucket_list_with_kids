// var algoliasearch = require('algoliasearch');
// var algoliasearch = require('algoliasearch/reactnative');
// var algoliasearch = require('algoliasearch/lite');
// or just use algoliasearch if you are using a <script> tag
// if you are using AMD module loader, algoliasearch will not be defined in window,
// but in the AMD modules of the page

var applicationID = 'CHZ1QFQS3L';
var apiKey = '2adac3ef18692463940451b5deb1f2c2';
var indexName = 'dev_BUCKETKIDS';

var client = algoliasearch(applicationID, apiKey);
var index = client.initIndex(indexName);

const search = instantsearch({
  appId: 'CHZ1QFQS3L',
  apiKey: '2adac3ef18692463940451b5deb1f2c2',
  indexName: 'dev_BUCKETKIDS',
  urlSync: true
});

// initialize currentRefinedValues
// search.addWidget(
//   instantsearch.widgets.currentRefinedValues({
//     container: '#current-refined-values',
//     // This widget can also contain a clear all link to remove all filters,
//     // we disable it in this example since we use `clearAll` widget on its own.
//     clearAll: false
//   })
// );

// // initialize pagination
// search.addWidget(
//   instantsearch.widgets.pagination({
//     container: '#pagination',
//     maxPages: 20,
//     // default is to scroll to 'body', here we disable this behavior
//     scrollTo: false
//   })
// );

// // initialize RefinementList
// search.addWidget(
//   instantsearch.widgets.refinementList({
//     container: '#refinement-list',
//     attributeName: 'category'
//   })
// );

// initialize SearchBox
search.addWidget(
  instantsearch.widgets.searchBox({
    container: '#search-box',
    placeholder: 'Search for destinations',
  })
);


// initialize hits widget
search.addWidget(
  instantsearch.widgets.hits({
    container: '#hits',
    autofocus: false,
    poweredBy: true,
    reset: true,
    loadingIndicator: false,
    templates: {
        empty: '<p class="info">No results were found with your current filters. <br/> <a class="button" href=".">Clear all the filters</a></p>',
        item: '<div class="container-result"><a href="{{_highlightResult.entity.value}}s/{{objectID}}">{{{_highlightResult.name.value}}}</a></div>'
      }
    })
);


// search.addWidget(
//   instantsearch.widgets.toggle({
//     container: '#free-shipping',
//     attributeName: 'entity',
//     label: 'Destination',
//     values: {
//       on: "destination",
//     },
//     templates: {
//       header: 'Shipping'
//     }
//   })
// );

search.start();



