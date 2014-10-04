DAB.ModernExecutions = function ($el) {

  var that = this;



  // Define a function that will create the controls for the unit.
  var createControls = function () {
    // If we haven't yet created the controls, only then create and bind them.
    if ($el.find('ul.controls').length === 0) {
      $el.append(
        '<ul class="controls">' +
          '<li class="control method-control" data-sort-key="method">method</li>' +
          '<li class="control region-control" data-sort-key="region">region</li>' +
          '<li class="control race-control" data-sort-key="race">race</li>' +
          '<li class="control juvenile-control" data-sort-key="juvenile">juvenile</li>' +
          '<li class="control sex-control" data-sort-key="sex">sex</li>' +
        '</ul>'
      );
      $el.find('ul.controls').on('click', function (e) {
        $(this).toggleClass('clicked');
      });
    }
  };

  // Define a function that will create the legend for the unit.
  var createLegend = function (key) {
    // Create the legend element if it hasn't been created before.
    if ($el.find('table.legend').length === 0) {
      $el.append('<table class="legend"></table>');
    }
    var $legend = $el.find('table.legend');
    $legend.empty();
    var segments = d3.keys(keys[key]); // Find the segments we'll be including in the legend.
    for (var i = 0; i < segments.length; i++) {
      // As we iterate over the segments, we're adding a color-block that matches up to the color of the rects in the viz.
      // We're also adding in the display name of the segment.
      $legend.append(
        '<tr>' +
          '<td style="background-color:' + c(keys[key][segments[i]].index) + ';" class="colorblock"></td>' +
          '<td>' + keys[key][segments[i]].name + '</td>' +
        '</tr>'
      );
    }
  };

  var createInspector = function (e, d3el) {
    var d = d3.select(d3el).datum();
    if ($el.find('.inspector').length === 0) {
      $el.append(
        '<table class="inspector">' +
          '<tr>' +
            '<th>name</th>' +
            '<td class="inspector-name">' + d.name + '</td>' + 
          '</tr>' +
          '<tr>' +
            '<th>method</th>' +
            '<td class="inspector-method">' + d.method + '</td>' + 
          '</tr>' +
          '<tr>' +
            '<th>race</th>' +
            '<td class="inspector-race">' + d.race + '</td>' + 
          '</tr>' +
          '<tr>' +
            '<th>sex</th>' +
            '<td class="inspector-sex">' + d.sex + '</td>' + 
          '</tr>' +
          '<tr>' +
            '<th>state</th>' +
            '<td class="inspector-state">' + d.state + '</td>' + 
          '</tr>' +
        '</table>'
      );

      var $inspector = $el.find('.inspector');      
      var transformAmount = (e.clientY - $el.offset().top > $(window).height() / 2) ? -$inspector.height() - 20 : 20
      $inspector.css({
        'top': e.clientY - $el.offset().top + 20 + transformAmount,
        'left': e.clientX - $el.offset().left - ($inspector.width() / 2)
      });
    }
  };


  /* Define some utility functions. */



  // Define a function that will sort data based on its key's index.
  var sort = function (data, key) {
    return data.sort(function (a, b) {
      // This is super readable, I know...
      // Compare based on the index in the keys variable (defined in the keys.json.js file).
      return keys[key][a[key]].index > keys[key][b[key]].index ? 1 : -1;
    });
  };



  // Define a function that will grab the year from the execution's date.
  // This is useful as we'll use that year to stack the data in some views.
  // It takes a date in the format dd/mm/year and returns just the year.
  //var year = function (date) { return new Date(date.split('/')[2] + '-01-01'); };
  var year = function (date) { return date.split('/')[2]; };





  var margin = { top: 22, right: 22, bottom: 33, left: 33 }
  ,   width  = $(window).width() - margin.left - margin.right
  ,   height = $(window).height() - margin.top - margin.bottom;

  var svg = d3.select($el[0]).append('svg')
    .attr({ width: width + margin.left + margin.right, height: height + margin.top + margin.bottom })
    .append('g').attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');





  // Define the color scale.
  var colors = [ 'rgb(255,149,207)', 'rgb(255,0,174)', 'rgb(255,207,149)', 'rgb(255,174,0)', 'rgb(149,207,255)', 'rgb(0,174,255)' ];
  //var c = d3.scale.ordinal().domain([5,4,3,2,1,0]).range(colors);
  var c = d3.scale.category20();

  // Define the x scale; we'll need all the representative years in the data.
  var years = [];
  var yearTicks = []; // Define the yearTicks array, which will be used to show only some of the ticks.
  for (var i = 1977; i <= 2014; i++) {
    years.push('' + i); // Cast it as a string.
    if ((i - 1977) % 4 === 0) {
      yearTicks.push('' + i)
    } else {
      yearTicks.push('');
    }
  }
  var x = d3.scale.ordinal().domain(years).rangeBands([0, width], 0);
  var y = d3.scale.linear().domain([0, 100]).range([height, 0]);
  var h = d3.scale.linear().domain([0, 100]).range([0, height]);


  // Create the x axis
  var xAxis = d3.svg.axis().scale(x).orient('bottom').tickValues(yearTicks);
  svg.append('g').attr('class', 'axis x-axis');
  d3.select('g.x-axis').call(xAxis)
    .attr('transform', 'translate(0,' + height + ')');
    //.selectAll('text').style('transform', 'rotate(90deg)');

  // Create the y axis
  var yAxis = d3.svg.axis().scale(y).orient('left');
  svg.append('g').attr('class', 'axis y-axis');
  d3.select('g.y-axis').call(yAxis);

  var create = function (data, key) {
    createLegend(key);
    var indices = {};
    var rect = svg.selectAll('rect')
      .data(sort(data, key))
      .enter()
      .append('rect')
      .attr('transform', function (d, i) {
        return 'translate(' + x(year(d.date)) + ',' + height + ')';
      })
      .transition()
      .delay(500)
      .duration(700)
      .attr('width', x.rangeBand() - 1)
      .attr('height', h(1) - 1)
      .attr('transform', function (d, i) {
        var date = year(d.date).toString(); 
        if ( indices[date] ) {
          indices[date]++;
        } else {
          indices[date] = 1;
        }
        return 'translate(' + x(date) + ',' + y(indices[date]) + ')';
      })
      .style( 'fill', function (d) { return c(keys[key][d[key]].index); } );
    $('rect').on('mouseenter', function (e) {
      createInspector(e, this);
    }).on('mouseleave', function (e) {
      $('.inspector').remove();
    })
  };


  var update = function (data, key) {
    createLegend(key);
    var indices = {};
    var rect = svg.selectAll('rect')
      .transition()
      .duration(500)
      .attr('transform', function (d, i) {
        return 'translate(' + x(year(d.date)) + ',' + height + ')';
      });
    rect = svg.selectAll('rect')
      .data(sort(data, key))
      .transition()
      .delay(500)
      .duration(100)
      .attr('transform', function (d, i) {
        return 'translate(' + x(year(d.date)) + ',' + height + ')';
      })
      .transition()
      .delay(600)
      .duration(500)
      .attr('transform', function (d, i) {
        var date = year(d.date).toString(); 
        if ( indices[date] ) {
          indices[date]++;
        } else {
          indices[date] = 1;
        }
        return 'translate(' + x(date) + ',' + y(indices[date]) + ')';
      })
      .style( 'fill', function (d) { return c(keys[key][d[key]].index); } );
  };


  d3.json('data/dpic.json', function (data) {
    create(data, 'race');

    createControls();
    $el.find('.control').on('click', function (e) {
      if (!$(this).hasClass('active')) {
        $el.find('.control').removeClass('active');
        $(this).addClass('active');
        var newKey = $(this).data('sort-key');
        update(data, newKey);          
      }   
    });

  });

};


