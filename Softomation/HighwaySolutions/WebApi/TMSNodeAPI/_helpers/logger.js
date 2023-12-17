const fs = require('fs');
const winston = require('winston');
const { combine, timestamp, printf } = winston.format;
const DailyRotateFile = require('winston-daily-rotate-file');

const logDirectory = './logs/apilogs';
//const logDirectory = __dirname + '/logs/apilogs';
// Create log directory and its parent directories if they don't exist
if (!fs.existsSync(logDirectory)) {
  fs.mkdirSync(logDirectory, { recursive: true });
}

const logFormat = printf(({ level, message, timestamp }) => {
  return `${timestamp} [${level.toUpperCase()}]: ${message}`;
});

const transport = new DailyRotateFile({
  filename: `${logDirectory}/%DATE%-logfile.log`,
  datePattern: 'YYYY-MM-DD',
  zippedArchive: true,
  maxSize: '20m',
  maxFiles: '7d',
});

const logger = winston.createLogger({
  format: combine(timestamp(), logFormat),
  transports: [
    new winston.transports.Console(),
    transport,
  ],
});

module.exports = logger;
