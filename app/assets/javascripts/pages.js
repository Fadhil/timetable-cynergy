function setTimetableListeners() {
  console.log("Setting up Timetable listeners");
  var table = document.getElementById("timetable-table");
	if(table !== null) {
		var cells = table.getElementsByTagName("td"); // 

		for(var i = 0; i < cells.length; i++){
				// Cell Object
				var cell = cells[i];
				// Track with onclick
				cell.onclick = function(){
						toggleSelect(this);
				}
		}
	}
}

function toggleSelect(cell) {
  var cellIndex  = cell.cellIndex;  

  var rowIndex = cell.parentNode.rowIndex;
 
  if(rowIndex!==0 && cellIndex !== 0) {
    if($(cell).hasClass("highlighted")){
      unHighlighCell(cell);
    } else {
      highlightCell(cell);
    }
  }
}

function highlightCell(cell) {
  $(cell).addClass("highlighted");
}

function unHighlighCell(cell) {
  $(cell).removeClass("highlighted");
}
