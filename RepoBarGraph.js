var userName = "walshk22"

const repoData = [
{RepoName: 'CS4052-Lab-1', numCommits: 8, color:'blue' }
{RepoName: 'Individual-Project-Task', numCommits:15 ,color:'green'}
{RepoName: 'Hello-World', numCommits:3,color:'red' }
{RepoName: 'Lowest-Common-Ancestor', numCommits: 15,color:'purple'}
{RepoName: 'Measuring-Software-Engineering', numCommits:4 , color:'yellow' }
{RepoName: 'CS4052-Final-Scene', numCommits: 4, color: 'orange'}
{RepoName: 'Software-Engineering-Bio', numCommits: 3, color: 'grey'}
];

var commitData = [80, 150, 30, 150, 40, 40, 30];

var svgWidth = 500, svgHeight =300; barPadding = 5;
var barWidth = (svgWidth/commitData.length);

var svg = d3.select('svg')
      .attr("width", svgWidth)
      .attr("height", svgHeight);


var barChart = svg.selectAll("rect")
    .data(commitData)
    .enter()
    .append("rect")
    .attr("y", function(d) {return svgHeight -d;})
    .attr("height", function(d) {return d;})
    .attr("width", barWidth - barPadding)
    .attr("transform", function(d, i){ 
      var translate = [barWidth * i, 0];
      return "translate("+translate +")";
    });

var text = svg.selectAll("text")
      .data(commitData)
      .enter()
      .append("text")
      .text(function(d) { return d/10; });
      .attr("y", function (d,i) { return svgHeight -d - 2; })
      .attr("x", function (d, i) { return barWidth * i; })
      .attr("fill", "#A64C38");
