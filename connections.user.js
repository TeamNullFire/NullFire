// ==UserScript==
// @name        replace connections with friend
// @namespace   nullfire
// @match       https://*.roblox.com/*
// @grant       none
// @version     1.0.6
// @author      seikoso
// @description 18/07/2025, 15:10:26
// @updateURL    https://github.com/TeamNullFire/NullFire/raw/refs/heads/main/connections.user.js
// ==/UserScript==

(function() {
    'use strict';

    function replaceText(node) {
        if (node.nodeType === Node.TEXT_NODE) {
            node.textContent = node.textContent.replace(/\bconnections\b/gi, match => {
                return match[0] === match[0].toUpperCase() ? 'Friends' : 'friends';
            }).replace(/\bconnect\b/gi, match => {
                return match[0] === match[0].toUpperCase() ? 'Friend' : 'friend';
            }).replace(/\bconnection\b/gi, match => {
                return match[0] === match[0].toUpperCase() ? 'Friend' : 'friend';
            });
        } else {
            for (let child of node.childNodes) {
                replaceText(child);
            }
        }
    }

    function observeMutations() {
        const observer = new MutationObserver(mutations => {
            mutations.forEach(mutation => {
                for (let node of mutation.addedNodes) {
                    replaceText(node);
                }
            });
        });

        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    }

    replaceText(document.body);
    observeMutations();
})();
