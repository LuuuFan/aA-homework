document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.setAttribute('height', '500');
  canvas.setAttribute('width', '500');

  var ctx = canvas.getContext('2d');
  ctx.fillStyle = 'blue';
  ctx.fillRect(100, 100, 100, 100);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "gray";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "purple";
  ctx.fill();
});
