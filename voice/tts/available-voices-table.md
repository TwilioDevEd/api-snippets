<label for="languages-dropdown">Filter by language
    <select name="languages" id="languages-dropdown"></select>
</label>

<table class="condensed" id="voices-table">
</table>

<script>
	// Create the and header row and populate the table with all available voices
	function createTable(voices) {
		const tableElement = document.getElementById('voices-table');
		tableElement.id = 'voices-table'
		const thead = document.createElement('thead');
		const tr = document.createElement('tr');
		tableElement.appendChild(thead)
		thead.appendChild(tr)

		const headerNames = ['Language', 'Locale', 'Type', 'Gender', 'Voice name (ID)']
		headerNames.forEach((headerName, index) => {
			const cell = document.createElement('td');
			cell.innerHTML = `${headerName}`
			tr.appendChild(cell);
		})

		const tbody = document.createElement('tbody');
		tbody.id = "table-body";
		tableElement.appendChild(tbody);

		createRows(voices);
	}

	function createRows(voices) {	
		const tbody = document.getElementById('table-body');
		
		// This removes the rows of data from the table
		while (tbody.firstChild) {
			tbody.removeChild(tbody.firstChild)
		}
		
		// Create new rows with the voices list passed to this function
		voices.forEach(voice => {
			const tr = tbody.insertRow();
			const fields = Object.keys(voice)
			fields.forEach(field => {
				const td = tr.insertCell()
				td.appendChild(document.createTextNode(`${voice[field]}`))
			})
		})
	}
	
// Create the table when the page loads.
createTable(voiceslist)

	function createAvailableLanguagesList(voiceslist) {
		let languages = []
		voiceslist.forEach(voice => {
			// Languages are in "English (Locale)" format, 
			// so grab the language without the locale. 
			let baseLanguage = voice.Language.split(' (')[0]
			if (!languages.includes(baseLanguage)) {
				languages.push(baseLanguage)
			}
		})
		return languages;
	}

	function handleLanguageSelect(event) {
		console.log('handleLanguageSelect')
		console.log('event.target', event.target.value)
		createFilteredTable(event.target.value)
	}

	// create the "Filter by language" dropdown options elements for each of the 
	// available languages
	function createLanguageFilterDropdown() {
		const availableLanguages = createAvailableLanguagesList(voiceslist) 
		let dropdownElement = document.getElementById('languages-dropdown');
		const seeAllLanguagesElement = document.createElement('option');
		seeAllLanguagesElement.setAttribute('value', 'all');
		seeAllLanguagesElement.append('All languages');
		dropdownElement.appendChild(seeAllLanguagesElement)
		dropdownElement.onchange = handleLanguageSelect

		availableLanguages.forEach(language => {
				const optionElement = document.createElement('option')
				optionElement.setAttribute('value', language);
				optionElement.append(`${language}`)
				dropdownElement.appendChild(optionElement)
		})
	}
			
	createLanguageFilterDropdown();

	// languageFilter is either 'all' or a base language, e.g. 'English' or 'Arabic')
	function createFilteredList(languageFilter) {
		let filteredVoices = [];
		if (languageFilter == 'all') {
			return voiceslist
		} else {
			voiceslist.forEach(voice => {
				let baseLanguage = voice.Language.split(' (')[0]
				if (baseLanguage == languageFilter) {
						filteredVoices.push(voice)
				}
			})
		}
		return filteredVoices;
	}

	// Take the selected language and populate the table with the related voices
	function createFilteredTable(languageToShow) {
		const voicesList = createFilteredList(languageToShow);
		createRows(voicesList)
	}

</script>