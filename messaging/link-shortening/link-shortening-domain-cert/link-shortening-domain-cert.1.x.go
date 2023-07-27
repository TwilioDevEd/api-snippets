// Download the helper library from https://www.twilio.com/docs/go/install
package main

import (
	"fmt"

	"github.com/twilio/twilio-go"
	messaging "github.com/twilio/twilio-go/rest/messaging/v1"
)

func main() {
	// Find your Account SID and Auth Token at twilio.com/console
	// and set the environment variables. See http://twil.io/secure
	client := twilio.NewRestClient()

	certAndPrivateKey := `-----BEGIN CERTIFICATE-----
	MIIDqDCCApACCQCBT5e22Q01fjANBgkqhkiG9w0BAQsFADCBlTELMAkGA1UEBhMC
	VVMxCzAJBgNVBAgMAkNBMRYwFAYDVQQHDA1TYW4gRnJhbmNpc2NvMRYwFAYDVQQK
	DA1FeGFtcGxlLCBJbmMuMRIwEAYDVQQLDAlUZXN0IERlcHQxFDASBgNVBAMMC2V4
	YW1wbGUuY29tMR8wHQYJKoZIhvcNAQkBFhB0ZXN0QGV4YW1wbGUuY29tMB4XDTIz
	MDcyNjIwMjUwMVoXDTI0MDcyNTIwMjUwMVowgZUxCzAJBgNVBAYTAlVTMQswCQYD
	VQQIDAJDQTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzEWMBQGA1UECgwNRXhhbXBs
	ZSwgSW5jLjESMBAGA1UECwwJVGVzdCBEZXB0MRQwEgYDVQQDDAtleGFtcGxlLmNv
	bTEfMB0GCSqGSIb3DQEJARYQdGVzdEBleGFtcGxlLmNvbTCCASIwDQYJKoZIhvcN
	AQEBBQADggEPADCCAQoCggEBAL+uk4TT+7npoMgnah59ZYu4VzM+PInRVbsvYa4S
	EfX+GzNy03VmVCsxnM2OxRQjqBxa5nKtRocRbFNk46xpB5fuOcJ6pKwWKo9equ6x
	RuZzbo8HkfmrP5a2GcA/Z+ncwjiyKbi7UefwGxaayGPiTFMEZIYVUHE6GDsRKYeJ
	nbylpzOtQMJqtRZitkC8BIDh52dZIi/GDPqB6fw4Cubpld9c5qNX575FuF0HUj5B
	lc0e4b7EihlNGu4mDUo8FJoHkVqVTFM6KtwhL9A5xdVjZ9XukX0uiaaI+LwzBKJs
	Y0zCt99hFp+dMwEc7wL7ECsXSFuH4RAnJn/QglYT9b1uO0MCAwEAATANBgkqhkiG
	9w0BAQsFAAOCAQEAHtUqqlWJ74LCFwVup2n0pUoIkHhUJdAv1lvSpyvA7sW/fKCU
	RhblmkqMy8i96xZGizuT86nUdf2XcufJhPFee7UopfZE4Ncya4te+7y/S17HM0uk
	LMEO1njLhzX+MDuLZOPPXw70JxN1oqxvyZKxrbvaOJ0O4duiEUOfKu//EYY0AdTl
	xCkHItiKEsmxjUPjroMd0APJp5aTPUS2c4moB9xjieft2uIG/7d/3gQfswnxJZcd
	EzQKclW4U28U1NVtcFhaNwEBC1H0TvBTp/8asl2aTOUP97wcLHPI9qzZWfAzizOU
	17S7MxNzjtt4i4/PQ7koIsq31wgmh2jDjh6mMw==
	-----END CERTIFICATE-----
	-----BEGIN PRIVATE KEY-----
	MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/rpOE0/u56aDI
	J2oefWWLuFczPjyJ0VW7L2GuEhH1/hszctN1ZlQrMZzNjsUUI6gcWuZyrUaHEWxT
	ZOOsaQeX7jnCeqSsFiqPXqrusUbmc26PB5H5qz+WthnAP2fp3MI4sim4u1Hn8BsW
	mshj4kxTBGSGFVBxOhg7ESmHiZ28paczrUDCarUWYrZAvASA4ednWSIvxgz6gen8
	OArm6ZXfXOajV+e+RbhdB1I+QZXNHuG+xIoZTRruJg1KPBSaB5FalUxTOircIS/Q
	OcXVY2fV7pF9LommiPi8MwSibGNMwrffYRafnTMBHO8C+xArF0hbh+EQJyZ/0IJW
	E/W9bjtDAgMBAAECggEAEoOQKBI5jBluuCZmb495EWe6tG5cdotLlorbCm8gYPws
	MGn01rANjSZ7mLcjffB7ulFlVMo7t6wNJHjoLKzwWNJfrdMeuKhjb/ma1Pc2e+fG
	U/ZNOSo7OBlan2EAbmwuLj+3G+qr3JUqaKKGnG8tJA+WjgTdAjK0SHA97KN0ItZK
	ZrZLEdrDTH+jCLl7eGzbAa7cMd24LyE9/Sz0IwJ+E2A2qoyBPGP8kRIByUH8pf94
	HnF7DzGBaV7UAC7xuzHPiV0vV+YNjvk236IbDCkGW5Y/j92KxmZKY1lIz/cDCNRD
	rAwZtRruIjNtgP9dNq44OQvjAvaFQIS+TMqJpqT3oQKBgQDftE5z/Hm/UyOyoh24
	GccisB37eDzDO7/rJq4l3/UvAu566xmI8W3ToQMaDbtOfGOoLKH3mPY8c+yYJrCt
	HM2uzxnFxPkfZ4I8JoplJ3pkNinYdX81jmmeO3gk6uzAgZOtSHSMP7TWkrTct/vf
	ZduvzlrGKtcbzfPuFdBABQeeaQKBgQDbWshIRzOkqku7X/4jj0qDa4dExtOzLzXw
	VsEV9sCXemMtFYmFWJAHeNvnfxKeBjtXa7skEQTojXcd/DJF1eTtLJNbpJpIUfiU
	BdqfmMvf7eDnsiUmzRlqxnc/bwhzzl3ac1gL0n7WXBA+HYEp5LhIlhGuzKlpIET3
	1sHKim7uywKBgQCyudOURzrd6Qa0SWGFHNNEm4DY0I97S9lhfl3UVMIG9UijXAHi
	r0EXu6RGxIHJiwfz7PTaZJMWaWe1h/PP2xtZdo0YvO5scL5UYFZhytC2D7APCJDB
	sS4hBVJP7IGKq/vYjfLPunY4mK13SmcpbK/AHhXYDZIe3MTuiu7+twYHQQKBgQDX
	4IZPq9NFcVvK8nP4pyLcJ80egNcD96iL+bVZWli8O3SzgAixtTE6SVWShNrbrqJk
	LOAmZKGCBQd/+R244QLF8CKuBFbaaeHMO96nRwcOQNwg6o/pmdwz21KsmSemYSi4
	vt+d8vFlIYHSv9LIWhKLTTXl5AGuNlXp2+8o2AjI9QKBgQDXQzJWmiVmTsBYOTWD
	YTp2o4Tn0HlLk3KHaBKHGiO0YGVuhXa2jz0u3jg5LLG7vusOZhQBkd4tN7L10ZMM
	l5jSr8uncW4/3gZ/O/URQZcMH+Uzttw8nVL3mzLS/M600I+ryZdLkrmtDQWUBRwj
	fRre92n5B+9AgpEl6RyegsXToA==
	-----END PRIVATE KEY-----`

	params := &messaging.UpdateDomainCertV4Params{}
	params.SetTlsCert(certAndPrivateKey)

	resp, err := client.MessagingV1.UpdateDomainCertV4("DNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", params)
	if err != nil {
		fmt.Println(err.Error())
	} else {
		if resp.DomainName != nil {
			fmt.Println(*resp.DomainName)
		} else {
			fmt.Println(resp.DomainName)
		}
	}
}
