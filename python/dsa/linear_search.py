# /usr/bin/env python3


def linear_search(arr, number):
    count = 0  # счетчик для оценки сложности
    for i in range(0, len(arr)):
        if arr[i] == number:
            return i, count
        count += 1
    return None, count


if __name__ == "__main__":
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    number = 7
    index, count = linear_search(arr, number)
    print("index: {}, iterations: {}".format(index, count))
