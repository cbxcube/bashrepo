#!/bin/bash

genpasswd() {
        length=8
        </dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c$length; echo ""

}

genpasswd

