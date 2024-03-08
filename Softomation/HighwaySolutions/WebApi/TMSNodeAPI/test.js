const express = require('express');
const bodyParser = require('body-parser');
const pdfMake = require('pdfmake');
const moment = require('moment');

const app = express();
const port = 3000;

// Define your header and footer
const header = { text: 'Header', alignment: 'center', margin: [0, 10] };
const footer = { text: 'Footer', alignment: 'center', margin: [0, 10] };

app.use(bodyParser.json());

app.post('/generate-pdf', (req, res) => {
    // Extract data for PDF content from request
    const { content } = req.body;

    // Define logo, company name, and report name
    const logo = 'data:image/jpeg;base64,...'; // Add your logo data here
    const companyName = 'Your Company Name';
    const reportName = 'Your Report Name';

    // Define PDF content definition
    const docDefinition = {
        content: [
            { text: 'PDF Content', alignment: 'center', margin: [0, 20] },
            { text: content, alignment: 'center' } // Add custom content
        ],
        footer: function(currentPage, pageCount) {
            return { text: `${currentPage} of ${pageCount}`, alignment: 'center' };
        }
    };

    // Create PDF document definition including header
    const pdfContentWithHeader = {
        header: {
            margin: [10, 10, 10, 20],
            columns: [
                {
                    //image: logo,
                    width: 50,
                    height: 50,
                    alignment: 'left'
                },
                {
                    width: '*',
                    stack: [
                        { text: companyName, fontSize: 10, margin: [0, 5] },
                        { text: reportName, fontSize: 10 }
                    ]
                },
                {
                    width: '*',
                    text: `Generated: ${moment().format('MMMM Do YYYY, h:mm:ss a')}`,
                    alignment: 'right',
                    fontSize: 10
                }
            ]
        },
        content: docDefinition.content,
        footer: docDefinition.footer
    };

    // Create PDF document
    const pdfDoc = pdfMake.createPdf(pdfContentWithHeader);

    // Generate and send PDF as response
    pdfDoc.getBase64((data) => {
        res.writeHead(200, {
            'Content-Type': 'application/pdf',
            'Content-Disposition': 'attachment;filename=example.pdf'
        });

        const download = Buffer.from(data.toString('utf-8'), 'base64');
        res.end(download);
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
