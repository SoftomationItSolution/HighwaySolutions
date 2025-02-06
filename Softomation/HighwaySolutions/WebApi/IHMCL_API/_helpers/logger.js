const fs = require('fs');
const winston = require('winston');
const { combine, timestamp, printf } = winston.format;
const DailyRotateFile = require('winston-daily-rotate-file');
const {
  root_path,
  log_path
} = require("./constants");
const path = require('path');
const logDirectory = path.join(root_path, log_path);

if (!fs.existsSync(logDirectory)) {
  fs.mkdirSync(logDirectory, { recursive: true });
}

const logFormat = printf(({ level, message, timestamp }) => {
  return `${timestamp} [${level.toUpperCase()}]: ${message}`;
});

const transport = new DailyRotateFile({
  filename: `${logDirectory}/%DATE%.log`,
  datePattern: 'YYYY-MM-DD',
  zippedArchive: true,
  maxSize: '20m',
  maxFiles: '7d',
  auditFile: path.join(logDirectory, 'audit.json'),  // Track log rotation
  createSymlink: true,  // Create a symlink to the latest log file
  utc: true, // Force UTC for date pattern, adjust based on your need
});

const logger = winston.createLogger({
  format: combine(timestamp(), logFormat),
  transports: [
    new winston.transports.Console(),
    transport,
  ],
});

module.exports = logger;
