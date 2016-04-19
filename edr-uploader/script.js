var io = require('sails.io.js')( require('socket.io-client') );
io.sails.url = 'http://edr';

var fs = require('fs');
var parse = require('csv-parse');
var transform = require('stream-transform');
var iconv = require('iconv-lite');


function insert(company, callback) {
  io.socket.post('/company', company, function(resData, jwRes) {
    callback(null, {resData: resData, jwRes: jwRes});
  });
}

var mongoWriter = transform(function(record, callback) {
  insert(record, callback);
}, {parallel: 100});
var parser = parse({delimiter: ';', columns: true})
var input = fs.createReadStream('/data/uo.csv');
var transformer = transform(function(record, callback){
  callback(null, {
    officialName: record["Найменування"],
    name: record["Скорочена назва"],
    id: record["   "],
    edrpou: record["Код ЄДРПОУ"],
    address: record["Місцезнаходження"],
    mainPerson: record["ПІБ керівника"],
    occupation: record["Основний вид діяльності"],
    status: record["Стан"]
  });
}, {parallel: 100});
var stringify = transform(function(record, callback) {
  callback(null, JSON.stringify(record));
});
input.pipe(iconv.decodeStream('win1251')).pipe(parser).pipe(transformer)
  .pipe(mongoWriter)
  .pipe(stringify).pipe(process.stdout);

