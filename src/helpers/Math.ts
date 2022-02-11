const getRandomNo = (min: number, max: number): number => {

    min = Math.ceil(min);
    max = Math.floor(max);

    return Math.floor(Math.random() * (max - min + 1)) + min;

}

const diff_minutes = (dt2: Date, dt1: Date, minutes: number = 5): boolean => {

    var diff = (dt2.getTime() - dt1.getTime()) / 1000;
    diff /= 60;

    return !(Math.abs(Math.round(diff)) > minutes);

}
export default {
    getRandomNo,
    diff_minutes
}