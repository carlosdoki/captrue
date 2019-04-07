/* eslint-disable object-curly-newline */

/* global Chart */

/**
 * --------------------------------------------------------------------------
 * CoreUI Free Boostrap Admin Template (v2.1.12): main.js
 * Licensed under MIT (https://coreui.io/license)
 * --------------------------------------------------------------------------
 */

/* eslint-disable no-magic-numbers */
// random Numbers

var random = function random() {
  
  return Math.round(Math.random() * 100);
}; // eslint-disable-next-line no-unused-vars
function connect(){
{/* <script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script> */}
  var config = {
    apiKey: "AIzaSyCXSUndUwqqJ6lKRRtvC6Vq68vV-mJdD9k",
    authDomain: "captrue-fe9e2.firebaseapp.com",
    databaseURL: "https://captrue-fe9e2.firebaseio.com",
    projectId: "captrue-fe9e2",
    storageBucket: "captrue-fe9e2.appspot.com",
    messagingSenderId: "737902920131"
  };
  firebase.initializeApp(config);
  // Get a reference to the database service
  var database = firebase.database().ref().child('colaborador');
  
}



var cardChart1=new Chart($('#card-chart1')
,{
  type:'line',
  data:{
    labels:['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    datasets:[{label:'My First dataset',
    backgroundColor:getStyle('--primary'),
    borderColor:'rgba(255,255,255,.55)',
    data:[65,59,84,84,51,55,40,84,84,51,55,40]
  }
]},
    options:{
      maintainAspectRatio:false,
      legend:{
        display:false
      },scales:
      {
        xAxes:[{
          gridLines:
          {
            color:'transparent',
            zeroLineColor:'transparent'
          },
        ticks:
        {
          fontSize:2,
          fontColor:'transparent'
        }
      }],
      yAxes:
      [{
        display:false,
        ticks:
        {
          display:false,
          min:35,
          max:89
        }
      }
    ]},
      elements:{line:{borderWidth:1},
      point:{radius:4,hitRadius:10,hoverRadius:4
      }
    }
  }
});
var chartPerformance = new Chart($('#canvas-performance'), {
  type: 'bar',
  data: {
    labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    datasets: [{
      label: 'Atende',
      backgroundColor: 'rgba(100, 168, 218, 0.8)',
      borderColor: 'rgba(100, 168, 218, 1)',
      pointBackgroundColor: 'rgba(100, 168, 218, 1)',
      pointBorderColor: '#fff',
      data: [ 2, random(), random(), random(), random(), random(), random(), random(), random(), random(), random(), random()]
    },{
      label: 'Atende Parcialmente',
      backgroundColor: 'rgba(255, 241, 122, 0.8)',
      borderColor: 'rgba(255, 241, 122,  1)',
      pointBackgroundColor: 'rgba(255, 241, 122, 1)',
      pointBorderColor: '#fff',
      data: [random(), random(), random(), random(), random(), random(), random(), random(), random(), random(), random(), random()]
  },{
        label: 'Excede Espectativas',
        backgroundColor: 'rgba(81, 208, 0, 0.8)',
        borderColor: 'rgba(81, 208, 0, 1)',
        pointBackgroundColor: 'rgba(81, 208, 0, 1)',
        pointBorderColor: '#fff',
        data: [random(), random(), random(), random(), random(), random(), random(), random(), random(), random(), random(), random()]
    },{
      label: 'Não Atende',
      backgroundColor: 'rgba(255, 39, 56, 0.8)',
      borderColor: 'rgba(255, 39, 56, 1)',
      pointBackgroundColor: 'rgba(255, 39, 56, 1)',
      pointBorderColor: '#fff',
      data: [random(), random(), random(), random(), random(), random(), random(), random(), random(), random(), random(), random()]
    }]
  },
  options: {
    responsive: true
  }
}); // eslint-disable-next-line no-unused-vars
var lineChart = new Chart($('#card-chart'), {
  type: 'line',
  data: {
    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgba(220, 220, 220, 0.2)',
      borderColor: 'rgba(220, 220, 220, 1)',
      pointBackgroundColor: 'rgba(220, 220, 220, 1)',
      pointBorderColor: '#fff',
      data: [random(), random(), random(), random(), random(), random(), random()]
    }, {
      label: 'My Second dataset',
      backgroundColor: 'rgba(151, 187, 205, 0.2)',
      borderColor: 'rgba(151, 187, 205, 1)',
      pointBackgroundColor: 'rgba(151, 187, 205, 1)',
      pointBorderColor: '#fff',
      data: [random(), random(), random(), random(), random(), random(), random()]
    }]
  },
  options: {
    responsive: true
  }
}); // eslint-disable-next-line no-unused-vars




var chartDesempenho = new Chart($('#canvas-desempenho'), {
  type: 'pie',
  data: {
    labels: ['Sim', 'Não'],
    datasets: [{
      data: [70,40],
      backgroundColor: ['#FF6384', '#36A2EB'],
      hoverBackgroundColor: ['#FF6384', '#36A2EB']
    }]
  },
  options: {
    responsive: true
  }
}); // eslint-disable-next-line no-unused-vars



var cardChart1=new Chart($('#card-chart2'),{type:'bar',data:{labels:['January','February','March','April','May','June','July'],datasets:[{label:'My First dataset',backgroundColor:getStyle('--primary'),borderColor:'rgba(255,255,255,.55)',data:[65,59,84,84,51,55,40]}]},options:{maintainAspectRatio:false,legend:{display:false},scales:{xAxes:[{gridLines:{color:'transparent',zeroLineColor:'transparent'},ticks:{fontSize:2,fontColor:'transparent'}}],yAxes:[{display:false,ticks:{display:false,min:35,max:89}}]},elements:{line:{borderWidth:1},point:{radius:4,hitRadius:10,hoverRadius:4}}}});
var barChart = new Chart($('#card-chart'), {
  type: 'bar',
  data: {
    labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
    datasets: [{
      backgroundColor: 'rgba(220, 220, 220, 0.5)',
      borderColor: 'rgba(220, 220, 220, 0.8)',
      highlightFill: 'rgba(220, 220, 220, 0.75)',
      highlightStroke: 'rgba(220, 220, 220, 1)',
      data: [random(), random(), random(), random(), random(), random(), random()]
    }]
  },
  options: {
    responsive: true
  }
}); // eslint-disable-next-line no-unused-vars

var doughnutChart = new Chart($('#canvas-3'), {
  type: 'doughnut',
  data: {
    labels: ['Red', 'Green', 'Yellow'],
    datasets: [{
      data: [300, 50, 100],
      backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56'],
      hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
    }]
  },
  options: {
    responsive: true
  }
}); // eslint-disable-next-line no-unused-vars

var radarChart = new Chart($('#canvas-4'), {
  type: 'radar',
  data: {
    labels: ['Eating', 'Drinking', 'Sleeping', 'Designing', 'Coding', 'Cycling', 'Running'],
    datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgba(220, 220, 220, 0.2)',
      borderColor: 'rgba(220, 220, 220, 1)',
      pointBackgroundColor: 'rgba(220, 220, 220, 1)',
      pointBorderColor: '#fff',
      pointHighlightFill: '#fff',
      pointHighlightStroke: 'rgba(220, 220, 220, 1)',
      data: [65, 59, 90, 81, 56, 55, 40]
    }, {
      label: 'My Second dataset',
      backgroundColor: 'rgba(151, 187, 205, 0.2)',
      borderColor: 'rgba(151, 187, 205, 1)',
      pointBackgroundColor: 'rgba(151, 187, 205, 1)',
      pointBorderColor: '#fff',
      pointHighlightFill: '#fff',
      pointHighlightStroke: 'rgba(151, 187, 205, 1)',
      data: [28, 48, 40, 19, 96, 27, 100]
    }]
  },
  options: {
    responsive: true
  }
}); // eslint-disable-next-line no-unused-vars

var pieChart = new Chart($('#canvas-5'), {
  type: 'pie',
  data: {
    labels: ['Red', 'Green', 'Yellow'],
    datasets: [{
      data: [300, 50, 100],
      backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56'],
      hoverBackgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
    }]
  },
  options: {
    responsive: true
  }
}); // eslint-disable-next-line no-unused-vars

var polarAreaChart = new Chart($('#canvas-6'), {
  type: 'polarArea',
  data: {
    labels: ['Red', 'Green', 'Yellow', 'Grey', 'Blue'],
    datasets: [{
      data: [11, 16, 7, 3, 14],
      backgroundColor: ['#FF6384', '#4BC0C0', '#FFCE56', '#E7E9ED', '#36A2EB']
    }]
  },
  options: {
    responsive: true
  }
});
//# sourceMappingURL=charts.js.map