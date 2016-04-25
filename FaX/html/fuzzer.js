// Modified from HD Moore's AxMan Fuzzer

// built in Alerts as delay for our POST requests to our tcp log server
// too fast and they do not arrive for each specific argument
// Attempt to read the value of each document property

// determine browser version
if (window.XMLHttpRequest) {
    var xhr = new XMLHttpRequest();
} else {
    var xhr = new ActiveXObject("Microsoft.XMLHTTP");
}
// don't actually call the log method yet anyway..only inline seems to work at the moment
/* function log(method,msg){
	xhr.open("POST", "http://localhost:9000/" , true);
	xhr.send("FuzzMethod: " + method + " MSG: " + msg);
} */

// delay gets script timeout
function delay(time) {
	var d1 = new Date();
	var d2 = new Date();
	while (d2.valueOf() < d1.valueOf() + time) {
		d2 = new Date();
  }
}

function fuzzReadProperties(obj) {
	var fs = ax[clsid]['Functions'];
	if (! fs)
		return;
	for (var i = 0; i <  ax[clsid]['FunctionCount']; i++) {
		var f = fs[i];
		// Skip all methods but the properties
		if (! (f && f['Name'] && f['Type'] == 'PropGet'))
			continue;

		window.status = clsid + " PropGet " + f['Name'];
		method = "fuzzReadProperties";

		try {
			var tmp = null;
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('tmp = obj.' + f['Name']);
		} catch(e) {}
	}
}
// Attempt to set the value of each property to its initial value
function fuzzReadWriteProperties(obj) {
	var fs = ax[clsid]['Functions'];
	if (! fs)
		return;
	for (var i = 0; i <  ax[clsid]['FunctionCount']; i++) {
		var f = fs[i];
		// Skip all methods but the properties
		if (! (f && f['Name'] && f['Type'] == 'PropGet'))
			continue;

		window.status = clsid + " PropSet (Same) " + f['Name'];
		method = "fuzzReadWriteProperties";
		var tmp = null;
		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('tmp = obj.' + f['Name']);
		} catch(e) {}
		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('obj.' + f['Name'] + '= tmp');
		} catch(e) {}
	}
}
// Attempt to set integer properties to evilProp values
function fuzzNumericProperties(obj) {
	var fs = ax[clsid]['Functions'];
	if (! fs)
		return;
	for (var i = 0; i <  ax[clsid]['FunctionCount']; i++) {
		var f = fs[i];
		// Skip all methods but the properties
		if (! (f && f['Name'] && (f['Type'] == 'PropPut' || f['Type'] == 'PropPutRef')))
			continue;

		window.status = clsid + " PropSet (Integer) " + f['Name'];
		method = "fuzzNumericProperties";

		// Read the old value so we can restore it
		var old = null;
		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('old = obj.' + f['Name']); } catch(e) {}
		// Iterate through all evilProp integer values
		for (var x in evilPropNum) {
			var tst = evilPropNum[x];

			window.status = clsid + " PropSet (Integer) " + f['Name'] + ' = ' + tst;
			method = "fuzzNumericProperties2";

			try {
					xhr.open("POST", "http://localhost:9000/" , true);
					xhr.send("FuzzMethod: " + method + " MSG: " + window.status );
					alert(method);
					eval('obj.' + f['Name'] + '= tst');  } catch(e) {}
		}
		// Restore the original property value
		window.status = clsid + " PropSet (Integer) " + f['Name'] + ' = (old) ' + old;
		method = "fuzzNumericProperties3";

		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('obj.' + f['Name'] + '= old');  } catch(e) {}
	}
}

function fuzzStringProperties(obj) {
	var fs = ax[clsid]['Functions'];
	if (! fs)
		return;
	for (var i = 0; i <  ax[clsid]['FunctionCount']; i++) {
		var f = fs[i];
		// Skip all methods but the properties
		if (! (f && f['Name'] && (f['Type'] == 'PropPut' || f['Type'] == 'PropPutRef')))
			continue;
		window.status = clsid + " PropSet (String) " + f['Name'];
		method = "fuzzStringProperties";
		// Read the old value so we can restore it
		var old = null;
		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('old = obj.' + f['Name']);
		} catch(e) {}
		// Iterate through all evilProp string values
		for (var x in evilPropStr) {
			var tst = evilPropStr[x];
			// Tracer magic
			if (tst.toString().indexOf(magic) != -1) {
				var tcls = clsid.toString();
				tcls = tcls.replace("{", "");
				tcls = tcls.replace("}", "");
				tst = tst.toString() + '_' + tcls + '_' + f['Name'];
			}
			window.status = clsid + " PropSet (String) " + f['Name'] + ' = ' + tst.length;
			method = "fuzzStringProperties2";
			try {
				xhr.open("POST", "http://localhost:9000/" , true);
				xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
				alert(method);
				eval('obj.' + f['Name'] + '= tst');
			} catch(e) {}
		}
		// Restore the original property value
		window.status = clsid + " PropSet (String) " + f['Name'] + ' = (old) ' + old;
		method = "fuzzStringProperties3";
		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('obj.' + f['Name'] + '= old');
		} catch(e) {}
	}
}

function fuzzObjectProperties(obj) {
	var fs = ax[clsid]['Functions'];
	if (! fs)
		return;
	for (var i = 0; i <  ax[clsid]['FunctionCount']; i++) {
		var f = fs[i];
		// Skip all methods but the properties
		if (! (f && f['Name'] && (f['Type'] == 'PropPut' || f['Type'] == 'PropPutRef')))
			continue;
		window.status = clsid + " PropSet (String) " + f['Name'];
		method = "fuzzObjectProperties";
		// Read the old value so we can restore it
		var old = null;
		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('old = obj.' + f['Name']); }
		catch(e) {}

		// Iterate through all evilProp object values
		for (var x in evilPropObj) {
			var tst = evilPropObj[x];
			window.status = clsid + " PropSet (String) " + f['Name'] + ' = ' + x;
			method = "fuzzObjectProperties2";
			try {
				xhr.open("POST", "http://localhost:9000/" , true);
				xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
				alert(method);
				eval('obj.' + f['Name'] + '= tst');
			} catch(e) {}
		}
		// Restore the original property value
		window.status = clsid + " PropSet (String) " + f['Name'] + ' = (old) ' + old;
		method = "fuzzObjectProperties3";
		try {
			xhr.open("POST", "http://localhost:9000/" , true);
			xhr.send("FuzzMethod: " + method + " MSG: " + window.status);
			alert(method);
			eval('obj.' + f['Name'] + '= old');
		} catch(e) {}
	}
}

function fuzzMethods(obj) {
	var fs = ax[clsid]['Functions'];
	if (! fs)
		return;
	for (var i = 0; i <  ax[clsid]['FunctionCount']; i++) {
		var f = fs[i];
		// Skip all the properties
		if (! (f && f['Name'] && ! f['Type']))
			continue;

		window.status = clsid + " Method (Init) " + f['Name'];
		method = "fuzzMethods";
		createEvilMethArgs(f['ArgCount']);
		fuzzMethodArgs(obj, f['Name'], f['ArgCount'], new Array());
		destroyEvilMethArgs();
	}
}
// This routine should be unrolled and use setTimeout()
function fuzzMethodArgs(obj, meth, argc, argv) {
	var tStr = 0;
	var tNum = 1;
	var tObj = 2;
	// Arguments are set, make the call
	if (! argc || argc == 0) {
		var mcall = 'obj.' + meth + '(';
		var targv = new Array();
		var info  = mcall;
		for (var aidx = 0; aidx < argv.length; aidx++) {
			if (aidx > 0) {
				mcall += ', ';
				info  += ',';
			}
			if (argv[aidx][0] == tStr) {
				targv[aidx] = evilMethStr[argv[aidx][1]].toString();
				// Tracer magic
				if (evilMethStr[argv[aidx][1]].toString().indexOf(magic) != -1) {
					var tcls = clsid.toString();
					tcls = tcls.replace("{", "");
					tcls = tcls.replace("}", "");
					targv[aidx] = targv[aidx] + '_' + tcls + '_' + meth;
				}
				info  += 'evilMethStr[' + argv[aidx][1] + ']('+targv[aidx].length+')';
				mcall += 'targv[' + aidx + ']';
			}
			else if (argv[aidx][0] == tNum) {
				targv[aidx] = evilMethNum[argv[aidx][1]];
				info  += ' evilMethNum[' + argv[aidx][1] + ']('+targv[aidx]+')';
				mcall += 'targv[' + aidx + ']';
			}
			else if (argv[aidx][0] == tObj) {
				info += ' evilMethObj[' + argv[aidx][1] + ']('+typeof(argv[aidx][0])+')';
				targv[aidx] = evilMethObj[argv[aidx][1]];
				mcall += 'targv[' + aidx + ']';
			} else {
				// ERROR CONDITION
				throw("Invalid argument type");
			}
		}
		mcall += ')';
		info  += ')';
		// Write this to the status bar
		window.status = clsid + ' ' + info;
		method = "fuzzMethodArgs";
		// Execute the method
		try { eval(mcall); } catch(e) { }
		// alert(mcall);
		return(0);
	}
	// Simple test for many-argument methods
	if (argv.length == 0 && (argc > evilMethSlowMax || argc < evilMethSlowMin)) {
		// Numeric testing
		for (var eidx in evilMethNum) {
			var argx   = new Array();
			for (var x = 0; x < argc; x++)
				argx[x] = new Array(tNum, eidx);

			fuzzMethodArgs(obj, meth, 0, argx);
		}
		// String testing
		for (var eidx in evilMethStr) {
			var argx   = new Array();
			for (var x = 0; x < argc; x++)
				argx[x] = new Array(tStr, eidx);

			fuzzMethodArgs(obj, meth, 0, argx);
		}
		// Object testing
		for (var eidx in evilMethObj) {
			var argx   = new Array();
			for (var x = 0; x < argc; x++)
				argx[x] = new Array(tObj, eidx);

			fuzzMethodArgs(obj, meth, 0, argx);
		}
		return(0);
	}
	// Slow mode testing - all permutations of args
	// Copy current args
	var argx = new Array();
	for (var argi in argv) argx[argi] = argv[argi];
	// What index does this level set?
	var argi = argx.length;
	// Numeric testing
	for (var eidx in evilMethNum) {
		argx[argi] = new Array(tNum, eidx);
		fuzzMethodArgs(obj, meth, argc - 1, argx);
	}
	// String testing
	for (var eidx in evilMethStr) {
		argx[argi] = new Array(tStr, eidx);
		fuzzMethodArgs(obj, meth, argc - 1, argx);
	}
	// Object testing
	for (var eidx in evilMethObj) {
		argx[argi] = new Array(tObj, eidx);
		fuzzMethodArgs(obj, meth, argc - 1, argx);
	}
}