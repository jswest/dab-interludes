var Mapper = function (el) {

  var that = this;
  var c = d3.scale.ordinal()
    .domain([0,1,2,3,4])
    .range([
      'rgb(70,62,64)',
      'rgb(68,70,79)',
      'rgb(58,86,106)',
      'rgb(37,117,159)',
      'rgb(0,174,255)'     
    ]);
  var r = d3.scale.linear()
    .domain([0,50])
    .range([4,40]);

  var range = function (input) {
    if (!input || input === "false" || input === 0) {
      return 0;
    } else if (input <= 1) {
      return 1;
    } else if (input <= 10) {
      return 2;
    } else if (input <= 50) {
      return 3;
    } else {
      return 4;
    }
  };

  that.build = function () {
    createKey();
    d3.json("data/us.topo.json", function (error, topology) {

      // error handling
      if (error) {
        console.log(error);
        return;
      }

      // mapping stuff
      var projection = d3.geo.albersUsa()
        .scale(1600)
        .translate([el.width() / 2, el.height() / 2]);
      that.path = d3.geo.path().projection(projection);
      
      // the svg element
      var svg = d3.select(el[0]).append('svg')
        .attr('width', el.width())
        .attr('height', el.height());

      // counties
      svg.append('g').attr('class', 'counties')
        .selectAll('path.county')
        .data(topojson.feature(topology, topology.objects.counties).features)
        .enter()
        .append('path')
        .attr('id', function (d) { return "fips-" + parseInt(d.properties.id); })
        .attr('d', that.path)
        .classed('county', true);

      // states
      svg.append('g').attr('class', 'states')
        .selectAll('path.state')
        .data(topojson.feature(topology, topology.objects.states).features)
        .enter()
        .append('path')
        .attr('d', that.path)
        .classed('state', true);

      d3.json('data/raw/espy/espy-by-decade-by-county.json', function (error, data) {
        run(0, data);
      });

    });
  };


  var badCounties = [];
  var badCount = 0;
  var paint = function (data) {
    
    d3.select('h1').html(data.startYear + '&ndash;' + data.endYear);
    d3.selectAll('path.county')
      .style('fill', 'rgb(70,62,64)');
    for (var i = 0; i < data.counties.length; i++) {
      var county = parseInt(data.counties[i].county);
      d3.select('path#fips-' + county)
        .style('fill', c(range(data.counties[i].count)));
      if($('path#fips-' + county).length === 0) {
        badCount++;
        if (badCounties.indexOf(county) === -1) {
          badCounties.push(county);
        }
      }
    }
    /*
    for (var i = 0; i < data.counties.length; i++) {
      var county = parseInt(data.counties[i].county);
      var county = data.counties[i].county;
      var el = d3.select('path#fips-' + county);
      if ($('path#fips-' + county).length > 0) {
        var datum = el.datum()
        var center = that.path.centroid(datum);
        d3.select('svg').append('circle')
          .attr('r', r(data.counties[i].count))
          .attr('cx', center[0])
          .attr('cy', center[1])
          .style('fill', 'rgb(0,174,255)');        
      } else {
        badCount++;
        if (badCounties.indexOf(county) === -1) {
          badCounties.push(county);
        }
      }
  
    }
    */

  };

  var run = function (i, data) {
    paint(data[i]);
    that.timer = setTimeout(function () {
      i++;
      if (i < data.length) {
        run(i, data);
      } else {
        i = 0;
        console.log(badCount);
        console.log(badCounties);
        //run(i, data);
      }
    }, 500);
  };


  var createKey = function () {
    el.append(
      '<table class="key">' +
        '<tr>' +
          '<td class="colorblock"></td>' +
          '<td>0 executions</td>' +
        '</tr>' +
        '<tr>' +
          '<td class="colorblock"></td>' +
          '<td>1 execution</td>' +
        '</tr>' +
        '<tr>' +
          '<td class="colorblock"></td>' +
          '<td>2 to 10 executions</td>' +
        '</tr>' +
        '<tr>' +
          '<td class="colorblock"></td>' +
          '<td>11 to 49 executions</td>' +
        '</tr>' +
        '<tr>' +
          '<td class="colorblock"></td>' +
          '<td>50 or more executions</td>' +
        '</tr>' +
      '</table>'
    );
    var table = el.find('table.key');
    for (var i = 0; i < table.find('td.colorblock').length; i++) {
      table.find('td.colorblock').eq(i).css('background-color', c(i));
    }
  };

};