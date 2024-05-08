const fs = require('fs');
const pdfMake = require('pdfmake/build/pdfmake');
const pdfFonts = require('pdfmake/build/vfs_fonts');
const constants = require("../_helpers/constants");
const moment = require('moment');
const path = require('path');
const {
    root_path,
    pc_path
  } = require("../_helpers/constants");
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
                const printedOn = `Printed on: ${moment(new Date().toLocaleString()).format('DD-MMM-YYYY HH:mm:ss')}`;
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
                        { text: moment(headerDetail.TransactionDate).format('DD-MMM-YYYY'), alignment: 'right', fontSize: '10', margin: header_margin },

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

function generateTransPdf(GeneratedBy, headerDetail,ReportData, pdfName) {
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
        let header_margin = [5, 10, 5, 10]
        let sign_margin = [5, 20, 5, 5]
        let pageMargins = [10, 20, 10, 30]
        let footerMargins = [10, 2, 10, 0]
        const  header_fontSize='8'
        const tableData = [
            [
                { text: "From Date Time", bold: true, alignment: 'left'},
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.StartDateTime, bold: false, alignment: 'left'},
                { text: "To Date Time", bold: true, alignment: 'right'},
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.EndDateTime, bold: false, alignment: 'left' }
            ],
            [
                { text: "Shift", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.ShiftName, bold: false, alignment: 'left' },
                { text: "Lane", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.LaneNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Transaction Type", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.TransactionTypeNames, bold: false, alignment: 'left' },
                { text: "Operator", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.OperatorName, bold: false, alignment: 'left' }
            ],
            [
                { text: "Vehicle Class", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.VehicleClassNames, bold: false, alignment: 'left' },
                { text: "Vehicle Sub Class", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.SubVehicleClassNames, bold: false, alignment: 'left' }
            ],
            [
                { text: "Plate Number", bold: true, alignment: 'left' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.PlateNumber, bold: false, alignment: 'left' },
                { text: "Transaction Id", bold: true, alignment: 'right' },
                { text: ":", bold: true, alignment: 'left'},
                { text: headerDetail.TransactionId, bold: false, alignment: 'left' }
            ]

        ];

        const _fontSize='5'

        const headersSet = new Set();
        ReportData.forEach(obj => Object.keys(obj).forEach(key => headersSet.add(key)));

        const headers = Array.from(headersSet);
        const tableRowData = ReportData.map(obj =>
            headers.map(key => ({ text: obj[key], bold: false, alignment: 'left' }))
        );

        const tableHeader = headers.map(header => ({ text: header, bold: true, alignment: 'left',fontSize: _fontSize,fillColor: '#CCCCCC',
        bold: true }));

        const formattedTableData = tableRowData.map(row => row.map(cell => ({ ...cell, fontSize: _fontSize })));

        // Insert table header as the first row in the tableData
        formattedTableData.unshift(tableHeader);
        const width=840  //600
        const docDefinition = {
            pageOrientation: 'landscape', 
            pageMargins: pageMargins,
            footer: function (currentPage, pageCount) {
                const printedOn = `Printed on: ${moment(new Date().toLocaleString()).format('DD-MMM-YYYY HH:mm:ss')}`;
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
                                    { text: ReportName+' Report', alignment: 'left', fontSize: 8,bold:true }
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
                        widths: ['12%', '1%', '37%','12%', '1%', '37%',],
                        body: tableData.map(row => row.map(cell => ({ text: cell.text, bold: cell.bold || false, alignment: cell.alignment,fontSize:header_fontSize })))
                    },
                    layout: 'noBorders',
                    margin: [0, 10]
                },
                {
                    canvas: [{ type: 'line', x1: 0, y1: 0, x2: width, y2: 0, lineWidth: 1 }]
                },
                {
                    table: {
                        //widths: new Array(headers.length).fill('*'), // Set equal width for all columns
                        body: formattedTableData
                    },
                    //layout: 'noBorders',
                    margin: [0, 10]
                }
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


module.exports = {
    generateFloatPdf,
    generateTransPdf
};