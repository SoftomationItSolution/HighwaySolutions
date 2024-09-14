const fs = require('fs');
const pdfMake = require('pdfmake/build/pdfmake');
const pdfFonts = require('pdfmake/build/vfs_fonts');
const constants = require("../_helpers/constants");
const moment = require('moment');
const momentTz = require('moment-timezone');
const path = require('path');
const { root_path, pc_path } = require("../_helpers/constants");

const pc_Directory = path.join(root_path, pc_path);
pdfMake.vfs = pdfFonts.pdfMake.vfs;
function fileToBase64(filePath) {
    try {
        const fileData = fs.readFileSync(filePath);
        const base64Data = fileData.toString('base64');
        const extension = path.extname(filePath).toLowerCase();
        const mimeType = {
            '.png': 'image/png',
            '.jpg': 'image/jpeg',
            '.jpeg': 'image/jpeg',

        }[extension] || 'application/octet-stream';

        return `data:${mimeType};base64,${base64Data}`;
    } catch (error) {
        return null;
    }
}


function generateFloatPdf(ReportName, GeneratedBy, Datacontent, headerDetail, pdfName) {
    try {
        const ProjectConfiguration = require(pc_Directory);
        const currentPath = path.resolve('./images');
        let imagePath = path.join(currentPath, 'logo.png');
        imagePath = fileToBase64(imagePath);

        const EventMediaPath = path.resolve('./EventMedia');
        let reportPath = path.join(EventMediaPath, 'reports')
        constants.CreateDirectory(reportPath)
        reportPath = path.join(reportPath, pdfName)
        //[L,T,R,B]
        let header_margin = [5, 5, 5, 5]
        let sign_margin = [5, 20, 5, 5]
        let pageMargins = [10, 5, 10, 30]
        let footerMargins = [10, 2, 10, 0]

        const docDefinition = {
            pageMargins: pageMargins,
            footer: function (currentPage, pageCount) {
                const printedOn = `Printed on: ${date_time_format(new Date())}`;
                const printedBy = `Printed by: ${GeneratedBy}`;
                return {
                    stack: [
                        { canvas: [{ type: 'line', x1: 0, y1: 0, x2: 600, y2: 0, lineWidth: 1 }] },
                        {
                            columns: [
                                { text: printedOn, alignment: 'left', fontSize: '7', margin: footerMargins },
                                { text: `Page ${currentPage.toString()} of ${pageCount}`, alignment: 'right', fontSize: '7', margin: footerMargins },

                            ],
                        },
                        {
                            columns: [
                                { text: printedBy, alignment: 'left', fontSize: '7', margin: footerMargins },
                            ],
                        }
                    ]
                };
            },
            content: [
                {
                    columns: [
                        (imagePath ?
                            {
                                image: imagePath,
                                fit: [80, 80],
                                alignment: 'left',
                            } :
                            {
                                text: ProjectConfiguration.RoadName,
                                alignment: 'left'
                            }
                        ),
                        {
                            width: '*', // Take up as much space as possible
                            stack: [
                                { text: ProjectConfiguration.ProjectName, alignment: 'center', fontSize: 12, bold: true },
                                { text: ProjectConfiguration.PlazaName, alignment: 'center', fontSize: 10 },
                                { text: ReportName, alignment: 'center', fontSize: 8 }
                            ],
                        },
                        {
                            width: '*',
                            text: '',
                        },
                    ]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: 600, y2: 0, lineWidth: 1 }]
                },
                {
                    columns: [
                        { text: "Lane:", alignment: 'left', fontSize: '10', margin: header_margin, bold: true },
                        { text: headerDetail.LaneName, alignment: 'left', fontSize: '10', margin: header_margin },
                        { text: "Shift:", alignment: 'center', fontSize: '10', margin: header_margin, bold: true },
                        { text: headerDetail.ShiftName, alignment: 'center', fontSize: '10', margin: header_margin },
                        { text: "Date:", alignment: 'right', fontSize: '10', margin: header_margin, bold: true },
                        { text: date_format(headerDetail.TransactionDate), alignment: 'right', fontSize: '10', margin: header_margin },

                    ],

                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: 600, y2: 0, lineWidth: 1 }]
                },
                {
                    table: Datacontent,
                    margin: [0, 10]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: 600, y2: 0, lineWidth: 1 }]
                },
                {
                    columns: [
                        { text: "Assigned By:", alignment: 'left', fontSize: '10', margin: header_margin, bold: true },
                        { text: headerDetail.AssignedBy, alignment: 'left', fontSize: '10', margin: header_margin },
                        { width: 'auto', text: "", alignment: 'center', fontSize: '10', margin: header_margin },
                        { text: "Assigned To:", alignment: 'right', fontSize: '10', margin: header_margin, bold: true },
                        { text: headerDetail.AssignedTo, alignment: 'right', fontSize: '10', margin: header_margin },
                    ],

                },
                {
                    columns: [
                        { text: "Signature", alignment: 'left', fontSize: '10', margin: sign_margin, bold: true },
                        { text: "Signature", alignment: 'right', fontSize: '10', margin: sign_margin, bold: true },
                    ],
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: 600, y2: 0, lineWidth: 1 }]
                },
            ],
            styles: {
                header: {
                    fontSize: 18,
                    bold: true,
                    margin: [0, 0, 0, 0]
                },
                subheader: {
                    fontSize: 14,
                    bold: true,
                    margin: [0, 0, 0, 0]
                },
                tableHeader: {
                    fillColor: '#CCCCCC',
                    bold: true
                }
            }
        };

        const pdfDoc = pdfMake.createPdf(docDefinition);
        pdfDoc.getBuffer((buffer) => {
            try {
                fs.writeFileSync(reportPath, buffer);
            } catch (error) {
                throw error;
            }
        });

    } catch (error) {
        throw error;
    }
}

function generateAVCPdf(GeneratedBy, headerDetail, ReportDataList, pdfName) {
    try {
        const ProjectConfiguration = require(pc_Directory);
        const ReportName = headerDetail.ReportType
        const currentPath = path.resolve('./images');
        let imagePath = path.join(currentPath, 'logo.png');
        imagePath = fileToBase64(imagePath);

        const EventMediaPath = path.resolve('./EventMedia');
        let reportPath = path.join(EventMediaPath, 'reports')
        constants.CreateDirectory(reportPath)
        reportPath = path.join(reportPath, pdfName)
        //[L,T,R,B]
        let pageMargins = [10, 20, 10, 30]
        let footerMargins = [10, 2, 10, 0]
        const header_fontSize = '8'
        const tableData = [
            [
                { text: "From Date Time", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.StartDateTime, bold: false, alignment: 'left' },
                { text: "To Date Time", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.EndDateTime, bold: false, alignment: 'left' }
            ],
            [
                { text: "Shift", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.ShiftName, bold: false, alignment: 'left' },
                { text: "Lane", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.LaneNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Transaction Type", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionTypeNames, bold: false, alignment: 'left' },
                { text: "Operator", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.OperatorName, bold: false, alignment: 'left' }
            ],
            [
                { text: "Vehicle Class", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.VehicleClassNames, bold: false, alignment: 'left' },
                { text: "Vehicle Sub Class", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.SubVehicleClassNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Plate Number", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.PlateNumber, bold: false, alignment: 'left' },
                { text: "Transaction Id", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionId, bold: false, alignment: 'left' }
            ]

        ];

        const _fontSize = '5'

        const headersSet = new Set();
        let ReportData=ReportDataList[1]
        let ReportDataPercantage=ReportDataList[2]
        ReportData.forEach(obj => Object.keys(obj).forEach(key => headersSet.add(key)));

        const headers = Array.from(headersSet);
        const tableRowData = ReportData.map((data, index) => {
            let percentageData = ReportDataPercantage[index] || {}; // Handle if there are missing percentages
        
            return headers.map(key => {
                let value = data[key];
                let percentageValue = percentageData[key];
                let combinedValue=''
                if (percentageValue != null && !isNaN(percentageValue)) {
                    percentageValue = parseFloat(percentageValue).toFixed(2);
                    combinedValue = `${value} / ${percentageValue}%`;
                } else {
                    percentageValue = ''; 
                    combinedValue = value;
                }
                let alignment = 'left';
                let color = 'black';
                if (!isNaN(value) && value !== null && value !== '') {
                    alignment = 'right';
                    if (value < 0) {
                        color = 'red';
                    }
                }
                if (key.toLowerCase() === 'date time') {
                    combinedValue = date_time_format_display(combinedValue);
                } else if (key.toLowerCase().includes('amount') || key.toLowerCase().includes('amt') || key.toLowerCase().includes('fee')) {
                    combinedValue = constants.INRFormat(combinedValue);
                }
                return { text: combinedValue, bold: false, alignment: alignment, fontSize: _fontSize, color: color };
            });
        });

        const tableHeader = headers.map(header => ({
            text: header, bold: true, alignment: 'left', fontSize: _fontSize, fillColor: '#CCCCCC',
            bold: true
        }));

        const formattedTableData = tableRowData.map((row, rowIndex) => 
            row.map((cell, colIndex) => {
                const diagonalColor = '#535e4b';
                let bgColor = null;
                let isBold = rowIndex === tableRowData.length - 1 || colIndex === row.length - 1;
                // if (isBold){
                //     bgColor = '#008000';
                // }
                if (colIndex === rowIndex + 1) {
                    bgColor = diagonalColor;
                }

                return { 
                    ...cell, 
                    fontSize: _fontSize, 
                    bold: isBold, 
                    fillColor: bgColor 
                };
            })
        );

        formattedTableData.unshift(tableHeader);
        const width = 840
        const docDefinition = {
            pageOrientation: 'landscape',
            pageMargins: pageMargins,
            footer: function (currentPage, pageCount) {
                const printedOn = `Printed on: ${date_time_format(new Date())}`;
                const printedBy = `Printed by: ${GeneratedBy}`;
                return {
                    stack: [
                        { canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }] },
                        {
                            columns: [
                                { text: printedOn, alignment: 'left', fontSize: '7', margin: footerMargins },
                                { text: `Page ${currentPage.toString()} of ${pageCount}`, alignment: 'right', fontSize: '7', margin: footerMargins },

                            ],
                        },
                        {
                            columns: [
                                { text: printedBy, alignment: 'left', fontSize: '7', margin: footerMargins },
                            ],
                        }
                    ]
                };
            },
            header: function (currentPage) {
                if (currentPage > 1) {
                    return {
                        columns: [
                            {
                                width: '*', // Take up as much space as possible
                                stack: [
                                    { text: ReportName + ' Report', alignment: 'left', fontSize: 8, bold: true }
                                ],
                                margin: [10, 10, 10, 0],
                            },
                            {
                                width: '*',
                                text: '',
                            },
                        ]
                    };
                } else {
                    return null; // No header on the first page
                }
            },
            content: [
                {
                    columns: [
                        (imagePath ?
                            {
                                image: imagePath,
                                fit: [80, 80],
                                alignment: 'left',
                            } :
                            {
                                text: ProjectConfiguration.RoadName,
                                alignment: 'left'
                            }
                        ),
                        {
                            width: '*', // Take up as much space as possible
                            stack: [
                                { text: ProjectConfiguration.ProjectName, alignment: 'center', fontSize: 12, bold: true },
                                { text: ProjectConfiguration.ControlRoomName, alignment: 'center', fontSize: 10 },
                                { text: ReportName, alignment: 'center', fontSize: 8 }
                            ],
                        },
                        {
                            width: '*',
                            text: '',
                        },
                    ]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                {
                    table: {
                        widths: ['12%', '1%', '37%', '12%', '1%', '37%',],
                        body: tableData.map(row => row.map(cell => ({ text: cell.text, bold: cell.bold || false, alignment: cell.alignment, fontSize: header_fontSize })))
                    },
                    layout: 'noBorders',
                    margin: [0, 10]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                {
                    table: {
                        body: formattedTableData
                    },
                    margin: [0, 10]
                }, {
                    columns: [
                        {
                            width: '*', // Take up as much space as possible
                            stack: [{ text: '***End of report***', alignment: 'center', fontSize: 12, bold: true }],
                        },

                    ]
                },
            ]
        };

        const pdfDoc = pdfMake.createPdf(docDefinition);
        pdfDoc.getBuffer((buffer) => {
            try {
                fs.writeFileSync(reportPath, buffer);
            } catch (error) {
                throw error;
            }
        });

    } catch (error) {
        throw error;
    }
}

function generateTransLandPdf(GeneratedBy, headerDetail, ReportData, pdfName) {
    try {
        const ProjectConfiguration = require(pc_Directory);
        const ReportName = headerDetail.ReportType
        const currentPath = path.resolve('./images');
        let imagePath = path.join(currentPath, 'logo.png');
        imagePath = fileToBase64(imagePath);

        const EventMediaPath = path.resolve('./EventMedia');
        let reportPath = path.join(EventMediaPath, 'reports')
        constants.CreateDirectory(reportPath)
        reportPath = path.join(reportPath, pdfName)
        //[L,T,R,B]
        let pageMargins = [10, 20, 10, 30]
        let footerMargins = [10, 2, 10, 0]
        const header_fontSize = '8'
        const tableData = [
            [
                { text: "From Date Time", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.StartDateTime, bold: false, alignment: 'left' },
                { text: "To Date Time", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.EndDateTime, bold: false, alignment: 'left' }
            ],
            [
                { text: "Shift", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.ShiftName, bold: false, alignment: 'left' },
                { text: "Lane", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.LaneNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Transaction Type", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionTypeNames, bold: false, alignment: 'left' },
                { text: "Operator", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.OperatorName, bold: false, alignment: 'left' }
            ],
            [
                { text: "Vehicle Class", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.VehicleClassNames, bold: false, alignment: 'left' },
                { text: "Vehicle Sub Class", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.SubVehicleClassNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Plate Number", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.PlateNumber, bold: false, alignment: 'left' },
                { text: "Transaction Id", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionId, bold: false, alignment: 'left' }
            ]

        ];

        const _fontSize = '4.5'

        const headersSet = new Set();
        ReportData.forEach(obj => Object.keys(obj).forEach(key => headersSet.add(key)));

        const headers = Array.from(headersSet);
        const tableRowData = ReportData.map(obj =>
            headers.map(key => {
                let value = obj[key];
                let alignment = 'left';
                let color = 'black'
                if (!isNaN(value) && value !== null && value !== '') {
                    alignment = 'right';
                    if (value < 0) {
                        color = 'red'
                    }
                }
                if (key.toLowerCase() === 'date time') {
                    value = date_time_format_display(value);
                }
                else if (key.toLowerCase().includes('amount') || key.toLowerCase().includes('amt') || key.toLowerCase().includes('fee')) {
                    value = constants.INRFormat(value);
                }
                // if (typeof value === 'boolean') {
                //     if (value) {
                //         value = '✔'; // Green tick icon
                //         color = 'green';
                //     } else {
                //         value = '&#10007;'; // Red cross icon
                //         color = 'red';
                //     }
                // }
                return { text: value, bold: false, alignment: alignment, fontSize: _fontSize, color: color };
            })
        );

        const tableHeader = headers.map(header => ({
            text: header, bold: true, alignment: 'left', fontSize: _fontSize, fillColor: '#CCCCCC',
            bold: true
        }));

        const formattedTableData = tableRowData.map(row => row.map(cell => ({ ...cell, fontSize: _fontSize })));

        formattedTableData.unshift(tableHeader);
        const width = 840
        const docDefinition = {
            pageOrientation: 'landscape',
            pageMargins: pageMargins,
            footer: function (currentPage, pageCount) {
                const printedOn = `Printed on: ${date_time_format(new Date())}`;
                const printedBy = `Printed by: ${GeneratedBy}`;
                return {
                    stack: [
                        { canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }] },
                        {
                            columns: [
                                { text: printedOn, alignment: 'left', fontSize: '7', margin: footerMargins },
                                { text: `Page ${currentPage.toString()} of ${pageCount}`, alignment: 'right', fontSize: '7', margin: footerMargins },

                            ],
                        },
                        {
                            columns: [
                                { text: printedBy, alignment: 'left', fontSize: '7', margin: footerMargins },
                            ],
                        }
                    ]
                };
            },
            header: function (currentPage) {
                if (currentPage > 1) {
                    return {
                        columns: [
                            {
                                width: '*', // Take up as much space as possible
                                stack: [
                                    { text: ReportName + ' Report', alignment: 'left', fontSize: 8, bold: true }
                                ],
                                margin: [10, 10, 10, 0],
                            },
                            {
                                width: '*',
                                text: '',
                            },
                        ]
                    };
                } else {
                    return null; // No header on the first page
                }
            },
            content: [
                {
                    columns: [
                        (imagePath ?
                            {
                                image: imagePath,
                                fit: [80, 80],
                                alignment: 'left',
                            } :
                            {
                                text: ProjectConfiguration.RoadName,
                                alignment: 'left'
                            }
                        ),
                        {
                            width: '*', // Take up as much space as possible
                            stack: [
                                { text: ProjectConfiguration.ProjectName, alignment: 'center', fontSize: 12, bold: true },
                                { text: ProjectConfiguration.ControlRoomName, alignment: 'center', fontSize: 10 },
                                { text: ReportName, alignment: 'center', fontSize: 8 }
                            ],
                        },
                        {
                            width: '*',
                            text: '',
                        },
                    ]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                {
                    table: {
                        widths: ['12%', '1%', '37%', '12%', '1%', '37%',],
                        body: tableData.map(row => row.map(cell => ({ text: cell.text, bold: cell.bold || false, alignment: cell.alignment, fontSize: header_fontSize })))
                    },
                    layout: 'noBorders',
                    margin: [0, 10]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                {
                    table: {
                        body: formattedTableData
                    },
                    margin: [0, 10]
                }, {
                    columns: [
                        {
                            width: '*', // Take up as much space as possible
                            stack: [{ text: '***End of report***', alignment: 'center', fontSize: 12, bold: true }],
                        },

                    ]
                },
            ]
        };

        const pdfDoc = pdfMake.createPdf(docDefinition);
        pdfDoc.getBuffer((buffer) => {
            try {
                fs.writeFileSync(reportPath, buffer);
            } catch (error) {
                throw error;
            }
        });

    } catch (error) {
        throw error;
    }
}

function generateTransPdf(GeneratedBy, headerDetail, ReportData, pdfName) {
    try {
        const ProjectConfiguration = require(pc_Directory);
        const ReportName = headerDetail.ReportType
        const currentPath = path.resolve('./images');
        let imagePath = path.join(currentPath, 'logo.png');
        imagePath = fileToBase64(imagePath);

        const EventMediaPath = path.resolve('./EventMedia');
        let reportPath = path.join(EventMediaPath, 'reports')
        constants.CreateDirectory(reportPath)
        reportPath = path.join(reportPath, pdfName)
        //[L,T,R,B]
        let pageMargins = [10, 20, 10, 30]
        let footerMargins = [10, 2, 10, 0]
        const header_fontSize = '8'
        const tableData = [
            [
                { text: "From Date Time", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.StartDateTime, bold: false, alignment: 'left' },
                { text: "To Date Time", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.EndDateTime, bold: false, alignment: 'left' }
            ],
            [
                { text: "Shift", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.ShiftName, bold: false, alignment: 'left' },
                { text: "Lane", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.LaneNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Transaction Type", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionTypeNames, bold: false, alignment: 'left' },
                { text: "Operator", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.OperatorName, bold: false, alignment: 'left' }
            ],
            [
                { text: "Vehicle Class", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.VehicleClassNames, bold: false, alignment: 'left' },
                { text: "Vehicle Sub Class", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.SubVehicleClassNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Plate Number", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.PlateNumber, bold: false, alignment: 'left' },
                { text: "Transaction Id", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionId, bold: false, alignment: 'left' }
            ]

        ];

        const _fontSize = '4.5'
        const headersSet = new Set();
        ReportData.forEach(obj => Object.keys(obj).forEach(key => headersSet.add(key)));
        const headers = Array.from(headersSet);
        const tableRowData = ReportData.map(obj =>
            headers.map(key => {
                let value = obj[key];
                let alignment = 'left';
                let color = 'black'
                if (!isNaN(value) && value !== null && value !== '') {
                    alignment = 'right';
                    if (value < 0) {
                        color = 'red'
                    }
                }
                if (key.toLowerCase() === 'date time') {
                    value = date_time_format_display(value);
                }
                else if (key.toLowerCase().includes('amount') || key.toLowerCase().includes('amt') || key.toLowerCase().includes('fee')) {
                    value = constants.INRFormat(value);
                }
                return { text: value, bold: false, alignment: alignment, fontSize: _fontSize, color: color };
            })
        );

        const tableHeader = headers.map(header => ({
            text: header, bold: true, alignment: 'left', fontSize: _fontSize, fillColor: '#CCCCCC',
            bold: true
        }));

        const formattedTableData = tableRowData.map(row => row.map(cell => ({ ...cell, fontSize: _fontSize })));

        // Insert table header as the first row in the tableData
        formattedTableData.unshift(tableHeader);
        const width = 600
        const docDefinition = {
            pageMargins: pageMargins,
            footer: function (currentPage, pageCount) {
                const printedOn = `Printed on: ${date_time_format(new Date())}`;
                const printedBy = `Printed by: ${GeneratedBy}`;
                return {
                    stack: [
                        { canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }] },
                        {
                            columns: [
                                { text: printedOn, alignment: 'left', fontSize: '7', margin: footerMargins },
                                { text: `Page ${currentPage.toString()} of ${pageCount}`, alignment: 'right', fontSize: '7', margin: footerMargins },

                            ],
                        },
                        {
                            columns: [
                                { text: printedBy, alignment: 'left', fontSize: '7', margin: footerMargins },
                            ],
                        }
                    ]
                };
            },
            header: function (currentPage) {
                if (currentPage > 1) {
                    return {
                        columns: [
                            {
                                width: '*', // Take up as much space as possible
                                stack: [
                                    { text: ReportName + ' Report', alignment: 'left', fontSize: 8, bold: true }
                                ],
                                margin: [10, 10, 10, 0],
                            },
                            {
                                width: '*',
                                text: '',
                            },
                        ]
                    };
                } else {
                    return null; // No header on the first page
                }
            },
            content: [
                {
                    columns: [
                        (imagePath ?
                            {
                                image: imagePath,
                                fit: [80, 80],
                                alignment: 'left',
                            } :
                            {
                                text: ProjectConfiguration.RoadName,
                                alignment: 'left'
                            }
                        ),
                        {
                            width: '*', // Take up as much space as possible
                            stack: [
                                { text: ProjectConfiguration.ProjectName, alignment: 'center', fontSize: 12, bold: true },
                                { text: ProjectConfiguration.ControlRoomName, alignment: 'center', fontSize: 10 },
                                { text: ReportName, alignment: 'center', fontSize: 8 }
                            ],
                        },
                        {
                            width: '*',
                            text: '',
                        },
                    ]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                {
                    table: {
                        widths: ['12%', '1%', '37%', '12%', '1%', '37%',],
                        body: tableData.map(row => row.map(cell => ({ text: cell.text, bold: cell.bold || false, alignment: cell.alignment, fontSize: header_fontSize })))
                    },
                    layout: 'noBorders',
                    margin: [0, 10]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                {
                    table: {
                        body: formattedTableData
                    },
                    margin: [0, 10]
                }, {
                    columns: [
                        {
                            width: '*', // Take up as much space as possible
                            stack: [{ text: '***End of report***', alignment: 'center', fontSize: 12, bold: true }],
                        },

                    ]
                },
            ]
        };

        const pdfDoc = pdfMake.createPdf(docDefinition);
        pdfDoc.getBuffer((buffer) => {
            try {
                fs.writeFileSync(reportPath, buffer);
            } catch (error) {
                throw error;
            }
        });

    } catch (error) {
        throw error;
    }
}

function generateDateWiseCountPdf(GeneratedBy, headerDetail, ReportDataList, pdfName) {
    try {
        const ProjectConfiguration = require(pc_Directory);
        const ReportName = headerDetail.ReportType
        const currentPath = path.resolve('./images');
        let imagePath = path.join(currentPath, 'logo.png');
        imagePath = fileToBase64(imagePath);
        const EventMediaPath = path.resolve('./EventMedia');
        let reportPath = path.join(EventMediaPath, 'reports')
        constants.CreateDirectory(reportPath)
        reportPath = path.join(reportPath, pdfName)
        //[L,T,R,B]
        let pageMargins = [20, 20, 20, 30]
        let footerMargins = [10, 2, 10, 0]
        const header_fontSize = '8'
        const tableData = [
            [
                { text: "From Date Time", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.StartDateTime, bold: false, alignment: 'left' },
                { text: "To Date Time", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.EndDateTime, bold: false, alignment: 'left' }
            ],
            [
                { text: "Shift", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.ShiftName, bold: false, alignment: 'left' },
                { text: "Lane", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.LaneNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Transaction Type", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionTypeNames, bold: false, alignment: 'left' },
                { text: "Operator", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.OperatorName, bold: false, alignment: 'left' }
            ],
            [
                { text: "Vehicle Class", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.VehicleClassNames, bold: false, alignment: 'left' },
                { text: "Vehicle Sub Class", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.SubVehicleClassNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Plate Number", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.PlateNumber, bold: false, alignment: 'left' },
                { text: "Transaction Id", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionId, bold: false, alignment: 'left' }
            ]

        ];

        const _fontSize = '7'
        const width = 600
        const can_width = 560
        const docDefinition = {
            pageMargins: pageMargins,
            footer: function (currentPage, pageCount) {
                const printedOn = `Printed on: ${date_time_format(new Date())}`;
                const printedBy = `Printed by: ${GeneratedBy}`;
                return {
                    stack: [
                        { canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }] },
                        {
                            columns: [
                                { text: printedOn, alignment: 'left', fontSize: '7', margin: footerMargins },
                                { text: `Page ${currentPage.toString()} of ${pageCount}`, alignment: 'right', fontSize: '7', margin: footerMargins },
                            ],
                        },
                        {
                            columns: [
                                { text: printedBy, alignment: 'left', fontSize: '7', margin: footerMargins },
                            ],
                        }
                    ]
                };
            },
            header: function (currentPage) {
                if (currentPage > 1) {
                    return {
                        columns: [
                            {
                                width: '*', // Take up as much space as possible
                                stack: [
                                    { text: ReportName + ' Report', alignment: 'left', fontSize: 8, bold: true }
                                ],
                                margin: pageMargins,
                            },
                            {
                                width: '*',
                                text: '',
                            },
                        ]
                    };
                } else {
                    return null; // No header on the first page
                }
            },
            content: [
                {
                    columns: [
                        (imagePath ?
                            {
                                image: imagePath,
                                fit: [80, 80],
                                alignment: 'left',
                            } :
                            {
                                text: ProjectConfiguration.RoadName,
                                alignment: 'left'
                            }
                        ),
                        {
                            width: '*', // Take up as much space as possible
                            stack: [
                                { text: ProjectConfiguration.ProjectName, alignment: 'center', fontSize: 12, bold: true },
                                { text: ProjectConfiguration.ControlRoomName, alignment: 'center', fontSize: 10 },
                                { text: ReportName, alignment: 'center', fontSize: 8 }
                            ],
                        },
                        {
                            width: '*',
                            text: '',
                        },
                    ]
                },
                {
                    table: {
                        widths: ['13%', '1%', '36%', '13%', '1%', '36%',],
                        body: tableData.map(row => row.map(cell => ({ text: cell.text, bold: cell.bold || false, alignment: cell.alignment, fontSize: header_fontSize })))
                    },
                    layout: 'noBorders',
                    margin: [10, 0, 10, 0]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: can_width, y2: 0, lineWidth: 1 }]
                },
                ...ReportDataList.map((dataSet, index) => {
                    if (index > 0) {
                        if (dataSet.length > 0) {
                            const headersSet = new Set();
                            dataSet.forEach(obj => {
                                Object.keys(obj).forEach(key => {
                                    if (key !== 'TDate') {
                                        headersSet.add(key);
                                    }
                                });
                            });
                            const headers = Array.from(headersSet);
                            const tableHeader = headers.map(header => ({
                                text: header, bold: true, alignment: 'left', fontSize: _fontSize, fillColor: '#CCCCCC'
                            }));
                            const tableRowData = dataSet.map(obj => {
                                const row = headers.map(key => {
                                    let value = obj[key];
                                    let alignment = 'left';
                                    let color = 'black'
                                    if (!isNaN(value) && value !== null && value !== '') {
                                        alignment = 'right';
                                        if (value < 0) {
                                            color = 'red'
                                        }
                                    }
                                    if (key.toLowerCase() === 'date time') {
                                        value = date_time_format_display(value);
                                    }
                                    else if (key.toLowerCase().includes('amount') || key.toLowerCase().includes('amt') || key.toLowerCase().includes('fee')) {
                                        value = constants.INRFormat(value);
                                    }
                                    return { text: value, bold: false, alignment: alignment, fontSize: _fontSize, color: color };

                                });
                                return row;
                            });

                            const totalRow = headers.map((key, index) => {
                                if (index === 0) {
                                    return { text: 'Total', bold: true, alignment: 'left', fillColor: '#CCCCCC', fontSize: _fontSize };
                                } else {
                                    const sum = dataSet.reduce((acc, obj) => {
                                        if (key !== 'TDate' && !isNaN(obj[key])) {
                                            return acc + parseFloat(obj[key]);
                                        }
                                        return acc;
                                    }, 0);
                                    if(ReportName.toLowerCase().includes('revenue')){
                                        return { text: constants.INRFormat(sum), bold: true, alignment: 'right', fillColor: '#CCCCCC', fontSize: _fontSize, };
                                    }
                                    else{
                                        return { text: sum, bold: true, alignment: 'right', fillColor: '#CCCCCC', fontSize: _fontSize, };
                                    }
                                }
                            });

                            const formattedTableData = tableRowData.map(row => row.map(cell => ({ ...cell, fontSize: _fontSize })));
                            formattedTableData.unshift(tableHeader);
                            formattedTableData.push(totalRow);
                            return [
                                { text: `Transaction date : ${dataSet[0]["TDate"]}`, alignment: 'left', bold: true, margin: [0, 10] },
                                {
                                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: can_width, y2: 0, lineWidth: 1, lineDash: { length: 2, space: 5 }, lineColor: 'gray' }]
                                },
                                {
                                    table: {
                                        body: formattedTableData
                                    },
                                    margin: [0, 10]
                                }
                            ];
                        }
                    }
                }).flat(),
                {
                    columns: [
                        {
                            width: '*', // Take up as much space as possible
                            stack: [{ text: '***End of report***', alignment: 'center', fontSize: 12, bold: true }],
                        },

                    ]
                },

            ]
        };

        // Create and save the PDF document
        const pdfDoc = pdfMake.createPdf(docDefinition);
        pdfDoc.getBuffer((buffer) => {
            try {
                fs.writeFileSync(reportPath, buffer);
            } catch (error) {
                throw error;
            }
        });


    } catch (error) {
        throw error;
    }
}

function generateMisPdf(GeneratedBy, headerDetail, ReportDataList, pdfName) {
    try {
        const ProjectConfiguration = require(pc_Directory);
        const ReportName = headerDetail.ReportType
        const currentPath = path.resolve('./images');
        let imagePath = path.join(currentPath, 'logo.png');
        imagePath = fileToBase64(imagePath);
        const EventMediaPath = path.resolve('./EventMedia');
        let reportPath = path.join(EventMediaPath, 'reports')
        constants.CreateDirectory(reportPath)
        reportPath = path.join(reportPath, pdfName)
        //[L,T,R,B]
        let pageMargins = [20, 20, 20, 30]
        let footerMargins = [10, 2, 10, 0]
        const header_fontSize = '8'
        const tableData = [
            [
                { text: "From Date Time", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.StartDateTime, bold: false, alignment: 'left' },
                { text: "To Date Time", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.EndDateTime, bold: false, alignment: 'left' }
            ],
            [
                { text: "Shift", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.ShiftName, bold: false, alignment: 'left' },
                { text: "Lane", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.LaneNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Transaction Type", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionTypeNames, bold: false, alignment: 'left' },
                { text: "Operator", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.OperatorName, bold: false, alignment: 'left' }
            ],
            [
                { text: "Vehicle Class", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.VehicleClassNames, bold: false, alignment: 'left' },
                { text: "Vehicle Sub Class", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.SubVehicleClassNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Plate Number", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.PlateNumber, bold: false, alignment: 'left' },
                { text: "Transaction Id", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left' },
                { text: headerDetail.TransactionId, bold: false, alignment: 'left' }
            ]

        ];

        const _fontSize = '6'
        const width = 840
        const docDefinition = {
            pageMargins: pageMargins,
            footer: function (currentPage, pageCount) {
                const printedOn = `Printed on: ${date_time_format(new Date())}`;
                const printedBy = `Printed by: ${GeneratedBy}`;
                return {
                    stack: [
                        { canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }] },
                        {
                            columns: [
                                { text: printedOn, alignment: 'left', fontSize: '7', margin: footerMargins },
                                { text: `Page ${currentPage.toString()} of ${pageCount}`, alignment: 'right', fontSize: '7', margin: footerMargins },
                            ],
                        },
                        {
                            columns: [
                                { text: printedBy, alignment: 'left', fontSize: '7', margin: footerMargins },
                            ],
                        }
                    ]
                };
            },
            header: function (currentPage) {
                if (currentPage > 1) {
                    return {
                        columns: [
                            {
                                width: '*', // Take up as much space as possible
                                stack: [
                                    { text: ReportName + ' Report', alignment: 'left', fontSize: 8, bold: true }
                                ],
                                margin: pageMargins,
                            },
                            {
                                width: '*',
                                text: '',
                            },
                        ]
                    };
                } else {
                    return null; // No header on the first page
                }
            },
            content: [
                {
                    columns: [
                        (imagePath ?
                            {
                                image: imagePath,
                                fit: [80, 80],
                                alignment: 'left',
                            } :
                            {
                                text: ProjectConfiguration.RoadName,
                                alignment: 'left'
                            }
                        ),
                        {
                            width: '*', // Take up as much space as possible
                            stack: [
                                { text: ProjectConfiguration.ProjectName, alignment: 'center', fontSize: 12, bold: true },
                                { text: ProjectConfiguration.ControlRoomName, alignment: 'center', fontSize: 10 },
                                { text: ReportName, alignment: 'center', fontSize: 8 }
                            ],
                        },
                        {
                            width: '*',
                            text: '',
                        },
                    ]
                },
                {
                    table: {
                        widths: ['13%', '1%', '36%', '13%', '1%', '36%',],
                        body: tableData.map(row => row.map(cell => ({ text: cell.text, bold: cell.bold || false, alignment: cell.alignment, fontSize: header_fontSize })))
                    },
                    layout: 'noBorders',
                    margin: [10, 0, 10, 0]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                ...ReportDataList.map((dataSet, index) => {
                    if (index > 0) {
                        if (dataSet.length > 0) {
                            const headersSet = new Set();
                            dataSet.forEach(obj => {
                                Object.keys(obj).forEach(key => {
                                    if (key !== 'ReportName') {
                                        headersSet.add(key);
                                    }
                                });
                            });
                            const headers = Array.from(headersSet);
                            const tableHeader = headers.map(header => ({
                                text: header, bold: true, alignment: 'left', fontSize: _fontSize, fillColor: '#CCCCCC'
                            }));
                            const tableRowData = dataSet.map(obj => {
                                const row = headers.map(key => {
                                    let value = obj[key];
                                    let alignment = 'left';
                                    let color = 'black'
                                    if (!isNaN(value) && value !== null && value !== '') {
                                        alignment = 'right';
                                        if (value < 0) {
                                            color = 'red'
                                        }
                                    }
                                    if (key.toLowerCase() === 'date time') {
                                        value = date_time_format_display(value);
                                    }
                                    else if (key.toLowerCase().includes('amount') || key.toLowerCase().includes('amt') || key.toLowerCase().includes('fee')) {
                                        value = constants.INRFormat(value);
                                    }
                                    return { text: value, bold: false, alignment: alignment, fontSize: _fontSize, color: color };

                                });
                                return row;
                            });

                            const totalRow = headers.map((key, index) => {
                                if (index === 0) {
                                    return { text: 'Total', bold: true, alignment: 'left', fillColor: '#CCCCCC', fontSize: _fontSize };
                                } else {
                                    const sum = dataSet.reduce((acc, obj) => {
                                        if (key !== 'ReportName' && !isNaN(obj[key])) {
                                            return acc + parseFloat(obj[key]);
                                        }
                                        return acc;
                                    }, 0);
                                    if(ReportName.toLowerCase().includes('revenue')){
                                        return { text: constants.INRFormat(sum), bold: true, alignment: 'right', fillColor: '#CCCCCC', fontSize: _fontSize, };
                                    }
                                    else{
                                        return { text: sum, bold: true, alignment: 'right', fillColor: '#CCCCCC', fontSize: _fontSize, };
                                    }
                                }
                            });

                            const formattedTableData = tableRowData.map(row => row.map(cell => ({ ...cell, fontSize: _fontSize })));
                            formattedTableData.unshift(tableHeader);
                            formattedTableData.push(totalRow);
                            return [
                                { text: `${dataSet[0]["ReportName"]}`, alignment: 'left', bold: true, margin: [0, 10] },
                                {
                                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1, lineDash: { length: 2, space: 5 }, lineColor: 'gray' }]
                                },
                                {
                                    table: {
                                        body: formattedTableData
                                    },
                                    margin: [0, 10]
                                }
                            ];
                        }
                    }
                }).flat(),
                {
                    columns: [
                        {
                            width: '*', // Take up as much space as possible
                            stack: [{ text: '***End of report***', alignment: 'center', fontSize: 12, bold: true }],
                        },

                    ]
                },

            ]
        };

        // Create and save the PDF document
        const pdfDoc = pdfMake.createPdf(docDefinition);
        pdfDoc.getBuffer((buffer) => {
            try {
                fs.writeFileSync(reportPath, buffer);
            } catch (error) {
                throw error;
            }
        });


    } catch (error) {
        throw error;
    }
}

function date_time_format(in_dateTime) {
    try {
        if (!moment(in_dateTime).isValid()) {
            throw new Error('Invalid date-time format');
        }
        return momentTz.tz(in_dateTime,'Asia/Kolkata').format('DD-MMM-YYYY HH:mm:ss.SSS');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
    }
}

function date_format(in_dateTime) {
    try {
        if (!moment(in_dateTime).isValid()) {
            throw new Error('Invalid date-time format');
        }
        return momentTz.tz(in_dateTime,'Asia/Kolkata').format('DD-MMM-YYYY');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
    }
}

function date_time_format_display(in_dateTime) {
    try {
         // Parse the input date-time string as UTC
        const utcDate = moment.utc(in_dateTime);
        return utcDate.format('DD-MMM-YYYY HH:mm:ss.SSS');
    } catch (error) {
        errorlogMessage(error, 'date_time_format error with input: ' + in_dateTime);
        return in_dateTime;
    }
}


module.exports = {
    generateFloatPdf,
    generateAVCPdf,
    generateTransPdf,
    generateTransLandPdf,
    generateDateWiseCountPdf,
    generateMisPdf
};