#!/bin/sh

TAG="${1}"
if [ -z "${TAG}" ]
then
	exit 0
fi

for industryname in ".* food.*|.* meal.*|.* restaurant.*|.* hospitality.*|.* catering.*" ".* military.*|.* defen[cs]e.*|.* armed.*" ".* telco.*|.* telecom.*|.* carrier.*|.* phone.*" ".* servic.*|.* ISP.*|.* MSP.*|.* provid.*" ".* NGO.*|.* charit.*" ".* credit.*|.* financ.*|.* bank.*|.* trading.*|.* stocks.*|.* forex.*|.* payment.*" ".* bitcoin.*" ".* pharma.*|.* health.*" ".* teach.*|.* academi.*|.* school.*|.* universit.*|.* college.*" ".* govern.*" ".* energy.*|.* gas.*|.* petrol.*|.* oil.*" ".* water.*|.* gas.*|.* electric.*|.* utilit.*" ".* transport.*|.* rail.*|.* train.*|.* car.*|.* vehicle.*|.* road.*|.* automotiv.*|.* boat.*|.* tanker.*|.* plane.*|.* airport.*" ".* retail.*|.* commerc.*" ".* cloud.*|.* devops.*" ".* factory.*|.* manufactur.*" ".* chemic.*"
do
	industryreportname="$(printf "${industryname}" | tr -d ".*| \[\]")"
	if [ ! -d "${industryreportname}" ]
	then
		mkdir "${industryreportname}"
	fi
	threat-crank/threat-crank.py -i "${industryname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/enterprise-attack/enterprise-attack.json" >"${industryreportname}/${TAG}.md"
	threat-crank/threat-crank.py -G unified -i "${industryname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/enterprise-attack/enterprise-attack.json" >"${industryreportname}/${TAG}.tsv"
	cp "${industryreportname}/${TAG}.md" "${industryreportname}/current.md"
	cp "${industryreportname}/${TAG}.tsv" "${industryreportname}/current.tsv"
	[ -z "${DEBUG}" ] && git add "${industryreportname}/*.md" "${industryreportname}/*.tsv"
	if [ ! -d "${industryreportname}/ics" ]
	then
		mkdir "${industryreportname}/ics"
	fi
	threat-crank/threat-crank.py -i "${industryname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/ics-attack/ics-attack.json" >"${industryreportname}/ics/${TAG}.md"
	threat-crank/threat-crank.py -G unified -i "${industryname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/ics-attack/ics-attack.json" >"${industryreportname}/ics/${TAG}.tsv"
	cp "${industryreportname}/ics/${TAG}.md" "${industryreportname}/ics/current.md"
	cp "${industryreportname}/ics/${TAG}.tsv" "${industryreportname}/ics/current.tsv"
	[ -z "${DEBUG}" ] && git add "${industryreportname}/ics/*.md" "${industryreportname}/ics/*.tsv"
	if [ ! -d "${industryreportname}/mobile" ]
	then
		mkdir "${industryreportname}/mobile"
	fi
	threat-crank/threat-crank.py -i "${industryname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/mobile-attack/mobile-attack.json" >"${industryreportname}/mobile/${TAG}.md"
	threat-crank/threat-crank.py -G unified -i "${industryname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/mobile-attack/mobile-attack.json" >"${industryreportname}/mobile/${TAG}.tsv"
	cp "${industryreportname}/mobile/${TAG}.md" "${industryreportname}/mobile/current.md"
	cp "${industryreportname}/mobile/${TAG}.tsv" "${industryreportname}/mobile/current.tsv"
	[ -z "${DEBUG}" ] && git add "${industryreportname}/mobile/*.md" "${industryreportname}/mobile/*.tsv"
done
for regionname in ".* norw.*|.* swed.*|.* finland.*|.* denmark.*|.* scandinav.*" ".* britain.*|.* united kingdom.*|.* england.*|.* scotland.*|.* ireland.*|.* wales.*" ".* saud.*|.* ksa.*" ".* qatar.*" ".* iran.*" ".* iraq.*" ".* china.*|.* chinese.*" ".* israel.*" ".* russia.*" ".* ukrain.*" ".* franc.*" ".* german.*" ".* europe.*" ".* america.*|.* united states.*" ".* canada.*" ".* india.*" ".* brazil.*" ".* australia.*" ".* zealand.*" ".* singapore.*" ".* pakistan.*" ".* poland.*|.* polska.*|.* polish.*"
do
	regionreportname="$(printf "${regionname}" | tr -d ".*| \[\]")"
	if [ ! -d "${regionreportname}" ]
	then
		mkdir "${regionreportname}"
	fi
	threat-crank/threat-crank.py -r "${regionname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/enterprise-attack/enterprise-attack.json" >"${regionreportname}/${TAG}.md"
	threat-crank/threat-crank.py -G unified -r "${regionname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/enterprise-attack/enterprise-attack.json" >"${regionreportname}/${TAG}.tsv"
	cp "${regionreportname}/${TAG}.md" "${regionreportname}/current.md"
	cp "${regionreportname}/${TAG}.tsv" "${regionreportname}/current.tsv"
	[ -z "${DEBUG}" ] && git add "${regionreportname}/*.md" "${regionreportname}/*.tsv"
	if [ ! -d "${regionreportname}/ics" ]
	then
		mkdir "${regionreportname}/ics"
	fi
	threat-crank/threat-crank.py -r "${regionname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/ics-attack/ics-attack.json" >"${regionreportname}/ics/${TAG}.md"
	threat-crank/threat-crank.py -G unified -r "${regionname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/ics-attack/ics-attack.json" >"${regionreportname}/ics/${TAG}.tsv"
	cp "${regionreportname}/ics/${TAG}.md" "${regionreportname}/ics/current.md"
	cp "${regionreportname}/ics/${TAG}.tsv" "${regionreportname}/ics/current.tsv"
	[ -z "${DEBUG}" ] && git add "${regionreportname}/ics/*.md" "${regionreportname}/ics/*.tsv"
	if [ ! -d "${regionreportname}/mobile" ]
	then
		mkdir "${regionreportname}/mobile"
	fi
	threat-crank/threat-crank.py -r "${regionname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/mobile-attack/mobile-attack.json" >"${regionreportname}/mobile/${TAG}.md"
	threat-crank/threat-crank.py -G unified -r "${regionname}" -A "https://raw.githubusercontent.com/mitre/cti/${TAG}/mobile-attack/mobile-attack.json" >"${regionreportname}/mobile/${TAG}.tsv"
	cp "${regionreportname}/mobile/${TAG}.md" "${regionreportname}/mobile/current.md"
	cp "${regionreportname}/mobile/${TAG}.tsv" "${regionreportname}/mobile/current.tsv"
	[ -z "${DEBUG}" ] && git add "${regionreportname}/mobile/*.md" "${regionreportname}/mobile/*.tsv"
done
[ -z "${DEBUG}" ] && git commit -m "Updated ${TAG}"
