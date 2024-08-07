import xml.etree.ElementTree as ET

class XMLResponseParser:
    def __init__(self, xml_string):
        self.tree = ET.ElementTree(ET.fromstring(xml_string))
        self.root = self.tree.getroot()

    def parse_violation_audit_details(self):
        result = {}
        for detail in self.root.find('AuditResults').findall('Detail'):
            name = detail.get('name')
            result[name] = {item.get('name'): item.get('value') for item in detail.findall('Item')}
        return result

    def parse_req_pay(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Txn': {k: self.root.find('Txn').get(k) for k in ['id', 'note', 'orgTxnId', 'refId', 'refUrl', 'ts', 'type']},
            'Resp': {
                'plazaId': self.root.find('Resp').get('plazaId'),
                'respCode': self.root.find('Resp').get('respCode'),
                'result': self.root.find('Resp').get('result'),
                'FareType': self.root.find('Resp').get('FareType'),
                'Ref': {k: self.root.find('Resp/Ref').get(k) for k in ['TollFare', 'approvalNum', 'errCode', 'settCurrency']},
                'Vehicle': {k: self.root.find('Resp/Vehicle').get(k) for k in ['TID', 'tagId']}
            }
        }
        return result

    def parse_plaza_details(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'PLaza': {
                'geoCode': self.root.find('PLaza').get('geoCode'),
                'id': self.root.find('PLaza').get('id'),
                'name': self.root.find('PLaza').get('name'),
                'subtype': self.root.find('PLaza').get('subtype'),
                'type': self.root.find('PLaza').get('type'),
                'BankDetails': {
                    detail.get('name'): detail.get('value') for detail in self.root.find('PLaza/BankDetails').findall('Detail')
                },
                'LaneDetails': [
                    {
                        lane.get('id'): {detail.get('name'): detail.get('value') for detail in lane.findall('Detail')}
                    } for lane in self.root.find('PLaza/LaneDetails').findall('Lane')
                ],
                'PlazaVehicleClass': [
                    {
                        vehicle_class.get('id'): {detail.get('name'): detail.get('value') for detail in vehicle_class.findall('Detail')}
                    } for vehicle_class in self.root.find('PLaza/PlazaVehicleClass').findall('VehicleClass')
                ],
                'TollFareRules': [
                    {
                        fare_type.get('id'): {detail.get('name'): detail.get('value') for detail in fare_type.findall('Detail')}
                    } for fare_type in self.root.find('PLaza/TollFareRules').findall('FareType')
                ],
                'PassSchemes': [
                    {
                        pass_scheme.get('id'): {detail.get('name'): detail.get('value') for detail in pass_scheme.findall('Detail')}
                    } for pass_scheme in self.root.find('PLaza/PassSchemes').findall('Pass')
                ]
            }
        }
        return result

    def parse_tag_details(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Txn': {k: self.root.find('Txn').get(k) for k in ['id', 'note', 'orgTxnId', 'refId', 'refUrl', 'ts', 'type']},
            'Resp': {
                'respCode': self.root.find('Resp').get('respCode'),
                'result': self.root.find('Resp').get('result'),
                'successReqCnt': self.root.find('Resp').get('successReqCnt'),
                'totReqCnt': self.root.find('Resp').get('totReqCnt'),
                'Vehicle': {
                    'VehicleDetails': {
                        detail.get('name'): detail.get('value') for detail in self.root.find('Resp/Vehicle/VehicleDetails').findall('Detail')
                    }
                }
            }
        }
        return result

    def parse_sync_time(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Resp': {
                'respCode': self.root.find('Resp').get('respCode'),
                'result': self.root.find('Resp').get('result'),
                'serverTime': self.root.find('Resp/Time').get('serverTime')
            }
        }
        return result

    def parse_toll_plaza_heart_beat(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Txn': {k: self.root.find('Txn').get(k) for k in ['id', 'note', 'refId', 'refUrl', 'ts', 'type', 'orgTxnId']},
            'Resp': {
                'errCode': self.root.find('Resp').get('errCode'),
                'result': self.root.find('Resp').get('result')
            }
        }
        return result

    def parse_check_transaction_status(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['ver', 'ts', 'orgId', 'msgId']},
            'Txn': {
                'id': self.root.find('Txn').get('id'),
                'note': self.root.find('Txn').get('note'),
                'refId': self.root.find('Txn').get('refId'),
                'refUrl': self.root.find('Txn').get('refUrl'),
                'ts': self.root.find('Txn').get('ts'),
                'type': self.root.find('Txn').get('type'),
                'orgTxnId': self.root.find('Txn').get('orgTxnId')
            },
            'Resp': {
                'ts': self.root.find('Resp').get('ts'),
                'result': self.root.find('Resp').get('result'),
                'respCode': self.root.find('Resp').get('respCode'),
                'totReqCnt': self.root.find('Resp').get('totReqCnt'),
                'successReqCnt': self.root.find('Resp').get('successReqCnt'),
                'TxnStatusReqList': [
                    {
                        'Status': {
                            'txnId': status.get('txnId'),
                            'txnDate': status.get('txnDate'),
                            'plazaId': status.get('plazaId'),
                            'laneId': status.get('laneId'),
                            'result': status.get('result'),
                            'errCode': status.get('errCode'),
                            'settleDate': status.get('settleDate'),
                            'TxnList': [
                                {
                                    txn_list.get('txnStatus'): {
                                        'txnReaderTime': txn_list.get('txnReaderTime'),
                                        'txnType': txn_list.get('txnType'),
                                        'txnReceivedTime': txn_list.get('txnReceivedTime'),
                                        'TollFare': txn_list.get('TollFare'),
                                        'FareType': txn_list.get('FareType'),
                                        'VehicleClass': txn_list.get('VehicleClass'),
                                        'RegNumber': txn_list.get('RegNumber'),
                                        'errCode': txn_list.get('errCode')
                                    }
                                } for txn_list in status.findall('TxnList')
                            ]
                        }
                    } for status in self.root.find('Resp/TxnStatusReqList').findall('Status')
                ]
            }
        }
        return result

    def parse_get_exception(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Txn': {
                'id': self.root.find('Txn').get('id'),
                'note': self.root.find('Txn').get('note'),
                'orgTxnId': self.root.find('Txn').get('orgTxnId'),
                'refId': self.root.find('Txn').get('refId'),
                'refUrl': self.root.find('Txn').get('refUrl'),
                'ts': self.root.find('Txn').get('ts'),
                'type': self.root.find('Txn').get('type')
            },
            'Resp': {
                'msgNum': self.root.find('Resp').get('msgNum'),
                'respCode': self.root.find('Resp').get('respCode'),
                'result': self.root.find('Resp').get('result'),
                'successReqCnt': self.root.find('Resp').get('successReqCnt'),
                'totReqCnt': self.root.find('Resp').get('totReqCnt'),
                'totalMsg': self.root.find('Resp').get('totalMsg'),
                'ExceptionList': [
                    {
                        exception.get('id'): {
                            'code': exception.get('code'),
                            'desc': exception.get('desc')
                        }
                    } for exception in self.root.find('Resp/ExceptionList').findall('Exception')
                ]
            }
        }
        return result

    def parse_query_exception_list(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Txn': {
                'id': self.root.find('Txn').get('id'),
                'note': self.root.find('Txn').get('note'),
                'orgTxnId': self.root.find('Txn').get('orgTxnId'),
                'refId': self.root.find('Txn').get('refId'),
                'refUrl': self.root.find('Txn').get('refUrl'),
                'ts': self.root.find('Txn').get('ts'),
                'type': self.root.find('Txn').get('type')
            },
            'Resp': {
                'msgNum': self.root.find('Resp').get('msgNum'),
                'respCode': self.root.find('Resp').get('respCode'),
                'result': self.root.find('Resp').get('result'),
                'successReqCnt': self.root.find('Resp').get('successReqCnt'),
                'totReqCnt': self.root.find('Resp').get('totReqCnt'),
                'totalMsg': self.root.find('Resp').get('totalMsg'),
                'ExceptionList': [
                    {
                        exception.get('id'): {
                            'code': exception.get('code'),
                            'desc': exception.get('desc')
                        }
                    } for exception in self.root.find('Resp/ExceptionList').findall('Exception')
                ]
            }
        }
        return result

    def parse_set_pass_scheme(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Txn': {
                'id': self.root.find('Txn').get('id'),
                'note': self.root.find('Txn').get('note'),
                'orgTxnId': self.root.find('Txn').get('orgTxnId'),
                'refId': self.root.find('Txn').get('refId'),
                'refUrl': self.root.find('Txn').get('refUrl'),
                'ts': self.root.find('Txn').get('ts'),
                'type': self.root.find('Txn').get('type')
            },
            'Resp': {
                'msgNum': self.root.find('Resp').get('msgNum'),
                'respCode': self.root.find('Resp').get('respCode'),
                'result': self.root.find('Resp').get('result'),
                'successReqCnt': self.root.find('Resp').get('successReqCnt'),
                'totReqCnt': self.root.find('Resp').get('totReqCnt'),
                'totalMsg': self.root.find('Resp').get('totalMsg')
            }
        }
        return result

    def parse_list_participants(self):
        result = {
            'Head': {k: self.root.find('Head').get(k) for k in ['msgId', 'orgId', 'ts', 'ver']},
            'Txn': {
                'id': self.root.find('Txn').get('id'),
                'note': self.root.find('Txn').get('note'),
                'orgTxnId': self.root.find('Txn').get('orgTxnId'),
                'refId': self.root.find('Txn').get('refId'),
                'refUrl': self.root.find('Txn').get('refUrl'),
                'ts': self.root.find('Txn').get('ts'),
                'type': self.root.find('Txn').get('type')
            },
            'Resp': {
                'msgNum': self.root.find('Resp').get('msgNum'),
                'respCode': self.root.find('Resp').get('respCode'),
                'result': self.root.find('Resp').get('result'),
                'successReqCnt': self.root.find('Resp').get('successReqCnt'),
                'totReqCnt': self.root.find('Resp').get('totReqCnt'),
                'Participants': [
                    {
                        participant.get('id'): {
                            'name': participant.get('name'),
                            'code': participant.get('code'),
                            'desc': participant.get('desc')
                        }
                    } for participant in self.root.find('Resp/Participants').findall('Participant')
                ]
            }
        }
        return result
