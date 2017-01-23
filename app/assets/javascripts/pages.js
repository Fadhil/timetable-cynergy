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

function setSelectpicker() {
	$('.selectpicker').selectpicker({
	});
}

function toggleSelect(cell) {
  var cellIndex  = cell.cellIndex;  
  var rowIndex = cell.parentNode.rowIndex;
 
  if(rowIndex!==0 && cellIndex !== 0) {
    if($(cell).hasClass("highlighted")){
      deselectTimetableCell(rowIndex, cellIndex);
      unHighlighCell(cell);
    } else {
      selectTimetableCell(rowIndex, cellIndex);
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

function selectTimetableCell(rowIndex, cellIndex) {
  cellCheckbox = $("input[name='registration[timetable][" + rowIndex + "][" + cellIndex + "]']"); 
  cellCheckbox.prop("checked", true);
}

function deselectTimetableCell(rowIndex, cellIndex) {
  cellCheckbox = $("input[name='registration[timetable][" + rowIndex + "][" + cellIndex + "]']"); 
  cellCheckbox.prop("checked", false);
}
