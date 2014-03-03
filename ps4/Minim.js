function Minim() {
    this.loadSample = function(src) {
        console.log(src);
        return new AudioSample(src);
    };
};

function AudioSample(src) {
    this.src = src;
    this.trigger = function() {
        console.log(this.src);
        (new Audio(this.src)).play();
    };
};