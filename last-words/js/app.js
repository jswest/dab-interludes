DAB.LastWords = function (el) {

  var that = this;

  var colors = [
    'rgb(70,62,64)',
    'rgb(68,70,79)',
    'rgb(58,86,106)',
    'rgb(37,117,159)',
    'rgb(0,174,255)',
  ];
  var colorScale = d3.scale.ordinal()
    .domain([0,1,2,3,4])
    .range(colors)

  var paragraphize = function (input) {
    input = '<p>' + input + '</p>';
    input.replace(/<br \/>/g, '</p><p>');
    return input;
  };

  this.build = function () {
    d3.json('data/last-words.json', function (data) {

      var data = {
        "name": "words",
        "children": data
      };

      var svg = d3.select(el[0]).append('svg')
        .attr('width', el.width())
        .attr('height', el.height());

      var pack = d3.layout.pack()
        .sort(null)
        .size([el.width(), el.height()])
        .value(function (d) {
          return d.count;
        });

      var nodes = pack.nodes(data);

      var fontScale = d3.scale.linear()
        .domain([
          d3.min(nodes[0].children, function (d) { return d.r; }),
          d3.max(nodes[0].children, function (d) { return d.r; })
        ])
        .range([8,60 ]);

      nodes[0].children;

      svg.selectAll('g.bubble-wrapper')
        .data(nodes)
        .enter()
        .append('g').attr('class', 'bubble-wrapper')
        .classed('parent', function (d) { return d.children ? true : false; })
        .attr('transform', function (d) {
          return 'translate(' + d.x + ',' + d.y + ')';
        })

      svg.selectAll('g.bubble-wrapper')
        .append('circle')
        .classed("bubble", true)
        .attr('r', function (d) { return d.r - 3; })
      svg.selectAll('g.bubble-wrapper')
        .append('text')
        .text(function (d) { return d.word; })
        .style('font-size', function (d) {
          return fontScale(d.r);
        })
        .attr('transform', function (d) {
          var ypos = fontScale(d.r) / 4;
          return 'translate(0,' + ypos + ')';
        })
      svg.selectAll('g.bubble-wrapper').on('click', function (d) {
        var d3el = d3.select(this);
        d3el.classed('active', true);
        el.append(
          '<div class="words-overlay">' +
            '<div class="words">' +
              '<button class="x"></button>' +
              '<h1>' + d.name + '</h1>' +
              paragraphize(d.statement) +
            '</div>' +
          '</div>');
        el.find('.words-overlay').on('click', function (e) {
          $(this).remove();
          d3el.classed('active', false);
        });
      });

    });
  };

};